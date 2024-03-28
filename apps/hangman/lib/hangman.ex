defmodule Hangman do

  alias Hangman.Runtime.Server
  alias Hangman.Type

  @opaque game :: Server.t

  # @spec new_game :: game
  # def new_game do
  #   { :ok, pid } = Hangman.Runtime.Application.start_game
  #   pid
  # end

  @spec new_game(game_code :: String.t()) :: game
  def new_game(game_code) do
    { :ok, pid } = Hangman.Runtime.Application.start_or_join_game(game_code)
    IO.puts "LOOK HERE in start_or_join_game(#{inspect game_code}) -> #{inspect pid}"
    pid
  end
  
  @spec make_move(game, String.t) :: Type.tally
  def make_move(game, guess) do
    GenServer.call(game, { :make_move, guess })
  end
  
  @spec tally(game) :: Type.tally()
  def tally(game) do
    GenServer.call(game, { :tally })
  end

  def get_messages(game) do
    GenServer.call(game, { :get_messages })
  end

  def add_message(game, msg) do
    GenServer.call(game, { :add_message, msg })
  end
end
