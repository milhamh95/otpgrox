defmodule BikeShed.Core do
  @max_length 3

  def new(input) do
    String.split(input, ",", trim: true)
  end

  # reducer
  def add(history, item) do
    [item | history]
    |> Enum.take(@max_length)
  end

  # converter
  def show(history) do
    Enum.join(history, "\n")
  end
end
