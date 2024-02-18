defmodule Loopy.BackSeat do
  @behaviour Loopy

  def go do
    Loopy.run(__MODULE__)
  end

  @impl true
  def work do
    [
      "ow \n",
      "quit it \n",
      "are we there yet \n",
      "let's go to the rock city \n",
      "i'm hungry"
    ]
    |> Enum.random()
    |> IO.puts()
  end

  @impl true
  def wait do
    5_000
    |> :random.uniform()
    |> Process.sleep()
  end
end
