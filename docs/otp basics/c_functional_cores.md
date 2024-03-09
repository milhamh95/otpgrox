# Functional Cores

```
iex(1)> input = "hello, world"
"hello, world"
iex(2)> String.split(input, ",")
["hello", " world"]
iex(3)> String.split("", ",", trim: true)
[]
iex(4)> construct = fn input -> String.split(input, ",", trim: true) end
#Function<42.105768164/1 in :erl_eval.expr/6>
iex(5)> input |> construct.()
["hello", " world"]
iex(6)> "" |> construct.()
[]
iex(7)> reduce = fn history, item ->
...(7)>  Enum.take([item | history], 5)
...(7)> end
#Function<41.105768164/2 in :erl_eval.expr/6>
iex(8)> input |> construct.() |> reduce.("elixir") |> reduce.("bruce")
["bruce", "elixir", "hello", " world"]
iex(9)> input |> construct.() |> reduce.("elixir") |> reduce.("bruce") |> reduce.("last") |> reduce.("shedding")
["shedding", "last", "bruce", "elixir", "hello"]
iex(10)> show = fn history -> Enum.join(history, "\n") end
#Function<42.105768164/1 in :erl_eval.expr/6>
iex(11)> input |> construct.() |> reduce.("elixir") |> reduce.("bruce") |> reduce.("last") |> reduce.("shedding") |> show.()
"shedding\nlast\nbruce\nelixir\nhello"
iex(12)> input |> construct.() |> reduce.("elixir") |> reduce.("bruce") |> reduce.("last") |> reduce.("shedding") |> show.() |> IO.puts
shedding
last
bruce
elixir
hello
:ok
```

- code -> `bike_shed`

```
start by running the callback

# start_link
# start a genserver
# 1st argument = module
# 2nd argument = initial argument

iex(1)> {:ok, pid} = GenServer.start_link(BikeShed, "")
{:ok, #PID<0.138.0>}
iex(2)> Process.alive? pid
true
iex(3)> GenServer.call(pid, :show)
""

```

```
iex(1)> {:ok, pid} = BikeShed.start_link ""
{:ok, #PID<0.138.0>}
iex(2)> :shed |> GenServer.whereis
#PID<0.138.0>
iex(3)> :shed |> GenServer.whereis |> Process.alive?
true
iex(4)> BikeShed.add("first")
:ok
iex(5)> BikeShed.add("second")
:ok
iex(6)> BikeShed.show
"second\nfirst"
iex(7)> recompile
Compiling 1 file (.ex)
:ok
iex(8)> BikeShed.show
second
first
:ok
iex(9)> BikeShed.add("third")
:ok
iex(10)> BikeShed.add("fourth")
:ok
iex(11)> BikeShed.show
fourth
third
second
:ok
```
