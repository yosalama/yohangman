defmodule BrowserWeb.HomeLive do
  use BrowserWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center">
      <form class="flex flex-col space-y-4" phx-submit="submit">
        <input
          type="text"
          name="player_name"
          class="flex-grow px-4 py-2 rounded-lg border-gray-300 focus:border-gray-500 focus:ring focus:ring-gray-200 focus:ring-opacity-50"
          placeholder="Enter Player Name"
        />
        <input
          type="text"
          name="game_code"
          class="flex-grow px-4 py-2 rounded-lg border-gray-300 focus:border-gray-500 focus:ring focus:ring-gray-200 focus:ring-opacity-50"
          placeholder="Enter Game Code"
        />
        <button class="px-6 py-3 rounded-lg bg-black text-white hover:bg-gray-900 transition-colors duration-300 ease-in-out">
          Join or Start Game
        </button>
      </form>
    </div>
    """
  end

  def handle_event("submit", %{"game_code" => code}, socket) when code == "",
    do: {:noreply, socket}

  def handle_event("submit", %{"player_name" => name}, socket) when name == "",
    do: {:noreply, socket}

  def handle_event("submit", %{"game_code" => code, "player_name" => name}, socket) do
    code = code 
      |> String.trim() |> String.replace(" ", "_") |> String.upcase()
    {:noreply, push_navigate(socket, to: "/hangman/#{code}/player/#{name}")}
  end
end
