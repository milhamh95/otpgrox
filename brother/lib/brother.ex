defmodule Brother do
  use GenServer

  # client
  def start_link({name, _character_quote} = arg) do
    GenServer.start_link(__MODULE__, arg, name: name)
  end

  # init
  def init(arg) do
    IO.puts("Starting... #{elem(arg, 0)}")
    {:ok, arg}
  end

  def child_spec([]) do
    child_spec({:julia, "Coffee... that's the stuff"})
  end

  def child_spec({name, _character_quote}=initial_argument) do
    %{
      id: name,
      start: {Brother, :start_link, [initial_argument]},
    }
  end
end
