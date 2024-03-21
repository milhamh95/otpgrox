defmodule Bot.Counter do
  def new(string), do: String.to_integer(string)
  def add(acc, i), do: acc + i
  def show(integer), do: inspect integer
end
