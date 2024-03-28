defmodule BrowserWeb.HangmanLive do
  use BrowserWeb, :live_view
  alias Phoenix.PubSub
  alias BrowserWeb.LiveComponent

  @states %{
    already_used: "That letter has already been used",
    bad_guess: "That's not in the word 👎",
    good_guess: "Good guess! 👍",
    initializing: "Type or click on your first guess",
    lost: "Sorry, you lost... 😞",
    won: "You won! 🎉"
  }

  def mount(%{"game_code" => game_code, "player_name" => player_name}, _session, socket) do
    case connected?(socket) do
      false ->
        {:ok, socket}

      true ->
        IO.puts("CONNECTED as #{player_name} in #{game_code}!!!")
        PubSub.subscribe(Browser.PubSub, game_code)
        game = Hangman.new_game(game_code)
        tally = Hangman.tally(game)
        alphabet = ?a..?z |> Enum.map(&<<&1::utf8>>)

        messages = Hangman.get_messages(game) |> Enum.reverse()

        IO.puts "Initial #{player_name} perspective messages in game, #{game_code}: #{inspect messages}"

        socket =
          socket
          |> assign(%{
            game_code: game_code,
            player_name: player_name,
            alphabet: alphabet,
            game: game,
            tally: tally
          })
          |> stream(:messages, messages)

        {:ok, socket}
    end
  end

  def render(assigns) do
    ~H"""
    <%= if Map.has_key?(assigns, :tally) do %>
      <div class="flex flex-col items-center justify-center">
        <div class="letters flex flex-row justify-center flex-wrap 
         text-lg sm:text-xl md:text-2xl lg:text-3xl">
          <div :for={ch <- @tally.letters} class={"px-2" <> " " <> classOf({:letter, ch})}>
            <%= ch %>
          </div>
        </div>
        <div class="flex flex-row game-state justify-center">
          <%= state_name(@tally.game_state) %>
        </div>
        <div class="alphabet py-4 flex flex-wrap justify-center
           text-lg sm:text-xl md:text-2xl lg:text-3xl">
          <%= for {letter, index} <- Enum.with_index(@alphabet) do %>
            <div :if={rem(index, 9) == 0} class="w-full"></div>
            <button
              phx-click="make_move"
              phx-value-key={letter}
              class={"px-2" <> " " <> classOf({:alphabet, @tally, letter})}
            >
              <%= letter %>
            </button>
          <% end %>
        </div>
        <.live_component module={LiveComponent.Figure} tally={@tally} id={1} />
        <.live_component module={LiveComponent.Chat} streams={@streams} id={1} />
        <div class="flex flex-col items-center pt-4">
          <p>Invite Others to Join:</p>
          <p><b><%= @game_code %></b></p>
        </div>
      </div>
    <% else %>
      <div>Loading...</div>
    <% end %>
    """
  end

  defp state_name(state) do
    @states[state] || "Unknown state"
  end

  defp classOf({:letter, letter}) do
    cond do
      letter == "_" -> ""
      true -> "font-bold"
    end
  end

  defp classOf({:alphabet, tally, letter}) do
    letterUsed = letter in tally.used
    letterCorrect = letterUsed and letter in tally.letters

    cond do
      letterCorrect -> "text-green-500"
      letterUsed -> "text-red-500"
      true -> ""
    end
  end

  def create_message(player, message) do
    %{id: UUID.uuid1(), player_name: player, message: Phoenix.HTML.html_escape(message)}
  end

  def handle_event("make_move", %{"key" => key}, socket) do
    tally = Hangman.make_move(socket.assigns.game, key)
    PubSub.broadcast(Browser.PubSub, socket.assigns.game_code, {:tally_update, tally})
    {:noreply, assign(socket, :tally, tally)}
  end

  # Coming From LiveComponent.Chat
  def handle_event("new_message", %{"message" => msg}, socket) do
    player_name = socket.assigns.player_name
    message = create_message(player_name, msg)
    Hangman.add_message(socket.assigns.game, message)
    PubSub.broadcast(Browser.PubSub, socket.assigns.game_code, {:new_message, message})
    {:noreply, stream_insert(socket, :messages, message)}
  end

  def handle_info({:new_message, message}, socket) do
    {:noreply, stream_insert(socket, :messages, message)}
  end

  def handle_info({:tally_update, tally}, socket) do
    {:noreply, assign(socket, :tally, tally)}
  end
end
