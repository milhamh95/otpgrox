defmodule Rememberall do
  use GenServer

  # client
  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: :mem)
  end

  # send message to gen server call
  # handle by `handle_call` function
  # sync function
  def get(pid \\:mem) do
      GenServer.call(pid, :get)
  end

  # send message to gen server cast
  # handle by `handle_cast` function
  # async function
  def set(pid \\:mem, value) do
    GenServer.cast(pid, {:set, value})
  end

  # send message to elixir send
  ## handle by `handle_info` function
  def say(pid \\:mem) do
    send(pid, :say)
  end

  # callback has type type
  # no reply
  # reply

  @impl true
  def init(old_state) do
    new_state = old_state
    {:ok, new_state}
  end

  @impl true
  def handle_call(:get, _from, old_state) do
    new_state = old_state
    to_client = old_state
    {:reply, to_client, new_state}
  end

  @impl true
  def handle_cast({:set, new_state}, _old_state) do
    {:noreply, new_state}
  end

  @impl true
  def handle_info(:say, old_state) do
    new_state = old_state
    IO.puts("The old value is #{old_state}")
    {:noreply, new_state}
  end
end
