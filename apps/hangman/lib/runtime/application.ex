defmodule Hangman.Runtime.Application do
  @super_name GameStarter

  use Application

  def start(_type, _args) do
    supervisor_spec = [
      {DynamicSupervisor, strategy: :one_for_one, name: @super_name},
      {Registry, keys: :unique, name: Registry.GameRooms}
    ]

    Supervisor.start_link(supervisor_spec, strategy: :one_for_one)
  end

  def start_or_join_game(game_code) do
    case _join_game(game_code) do
      {:error, _reason} -> _start_game(game_code)
      {:ok, pid} -> {:ok, pid}
    end
  end

  defp _join_game(game_code) do
    case Registry.lookup(Registry.GameRooms, game_code) do
      [] ->
        {:error, "No Room to Join"}

      [{_owner_pid, pid}] ->
        IO.puts("JOINED #{game_code} in #{inspect pid} on first try")
        {:ok, pid}
    end
  end

  defp _join_game(game_code, retries) when retries <= 0,
    do: {:error, "Unable to Join #{game_code}"}

  defp _join_game(game_code, retries) when retries > 0 do
    case Registry.lookup(Registry.GameRooms, game_code) do
      [{_owner_pid, pid}] ->
        IO.puts("JOINED #{game_code} in #{inspect pid}, retries left: #{retries}")
        {:ok, pid}

      _ ->
        _join_game(game_code, retries - 1)
    end
  end

  defp _start_game do
    DynamicSupervisor.start_child(@super_name, {Hangman.Runtime.Server, nil})
  end

  defp _start_game(game_code) do
    {:ok, pid} = _start_game()

    joining_retries = 3

    case Registry.register(Registry.GameRooms, game_code, pid) do
      {:ok, _owner_pid} -> 
        IO.puts("STARTED #{game_code} in #{inspect pid}")
        {:ok, pid}

      {:error, reason} ->
        IO.puts(
          "Unable to register #{inspect(pid)} for #{game_code}, error: #{inspect(reason)}"
        )

        _join_game(game_code, joining_retries)
    end
  end

  def handle_info({:EXIT, pid, reason}, state) do
    IO.puts("GenServer crashed for #{inspect pid} with reason, #{inspect reason}, and state: #{inspect state}")
    {:stop, :normal, state}
  end
end
