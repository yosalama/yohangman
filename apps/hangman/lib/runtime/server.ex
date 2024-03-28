defmodule Hangman.Runtime.Server do

  alias Hangman.Runtime.Watchdog

  @type t :: pid()

  @idle_timeout 1 * 60 * 15 * 1000  # 15 min in ms

  alias Hangman.Impl.Game

  use GenServer

  ### client process

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil) 
  end


  ### server process

  def init(_) do
    watcher = Watchdog.start(@idle_timeout)
    messages = []
    { :ok, { Game.new_game, watcher, messages }}
  end

  def handle_call({ :make_move, guess }, _from, { game, watcher, messages }) do
    Watchdog.im_alive(watcher)
    { updated_game, tally } = Game.make_move(game, guess) 
    { :reply, tally, { updated_game, watcher, messages } }
  end

  def handle_call({ :tally }, _from, { game, watcher, messages }) do
    Watchdog.im_alive(watcher)
    { :reply, Game.tally(game), { game, watcher, messages } } 
  end

  def handle_call({ :get_messages }, _from, { game, watcher, messages }) do
    Watchdog.im_alive(watcher)
    { :reply, messages, { game, watcher, messages } } 
  end

  def handle_call({ :add_message, msg }, _from, { game, watcher, messages }) do
    Watchdog.im_alive(watcher)
    messages = [msg | messages]
    { :reply, messages, { game, watcher, messages } } 
  end
end
