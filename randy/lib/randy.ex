defmodule Randy do
  use GenServer

  @impl true
  def init(max) do
    {:ok, max}
  end

  # gen server will call handle_call
  # every time a message happens
  @impl true
  def handle_call(:rand, _from, max) do
    {:reply, :rand.uniform(max), max}
  end
end
