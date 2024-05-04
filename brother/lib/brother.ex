defmodule Brother do
  use GenServer

  # client
  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: :big)
  end

  # init
  def init(arg) do
    IO.puts("Starting...")
    {:ok, arg}
  end
end
