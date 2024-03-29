defmodule Bot.Service do
  alias Bot.Counter

  # client

  def start(input) do
    spawn(fn -> input |> Counter.new |> loop end)
  end

  def inc(pid), do: send(pid, :inc)

  def dec(pid), do: send(pid, :dec)

  def show(pid) do
    send(pid, {:show, self()})
    receive do
      m -> m
    end
  end


  # server

  def loop(counter) do
    counter
    |> listen
    |> loop
  end

  def listen(counter) do
    receive do
      :inc ->
        Counter.add(counter, 1)
      :dec ->
        Counter.add(counter, - 1)
      {:show, from} ->
        result = Counter.show(counter)
        send(from, result)
        counter
    end
  end
end
