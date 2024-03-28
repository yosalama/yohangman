defmodule BrowserWeb.LiveComponent.Chat do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="chat items-center justify-center">
      <div
        id="chat-messages"
        class="window w-full h-32 overflow-y-auto border border-black p-4"
        phx-update="stream"
      >
        <%= for {_id, msg} <- @streams.messages do %>
          <div class="message whitespace-normal">
            <b><%= msg.player_name %></b>: <%= msg.message %>
          </div>
        <% end %>
      </div>

      <form class="mt-4 sm:w-1/4 flex items-center" phx-submit="new_message">
        <input
          type="text"
          name="message"
          placeholder="Send a message"
          class="px-4 py-2 rounded-lg border-gray-300 focus:border-gray-500 focus:ring focus:ring-gray-200 focus:ring-opacity-50"
        />
        <button type="Send" class="ml-2 px-4 py-2 rounded-lg bg-black text-white">
          Send
        </button>
      </form>
    </div>
    """
  end
end
