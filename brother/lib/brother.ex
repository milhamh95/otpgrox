defmodule Brother do
  use GenServer

  def start_child(initial_arg) do
    DynamicSupervisor.start_child(
      :dsup,
      {__MODULE__, initial_arg}
    )
  end

  # client
  def start_link({name, _character_quote} = arg) do
    GenServer.start_link(__MODULE__, arg, name: name)
  end

  # init
  def init(arg) do
    IO.puts("Starting... #{elem(arg, 0)}")
    {:ok, arg}
  end

  def child_spec({name, _character_quote}=initial_argument) do
    %{
      id: name,
      start: {Brother, :start_link, [initial_argument]},
    }
  end
end
