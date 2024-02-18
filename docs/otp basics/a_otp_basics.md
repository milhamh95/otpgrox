```sh
iex(2)> GenServer.start_link Randy, 6
{:ok, #PID<0.152.0>}
iex(3)> {:ok, pid} = v 3
** (RuntimeError) v(3) is out of bounds, the currently preserved history ranges from 1 to 3 (or use negative numbers to look from the end)
    (iex 1.15.7) lib/iex/history.ex:58: IEx.History.nth/2
    (iex 1.15.7) lib/iex/helpers.ex:380: IEx.Helpers.v/1
iex(3)> {:ok, pid} = v 2
{:ok, #PID<0.152.0>}
iex(4)> recompile
Compiling 1 file (.ex)
:ok
iex(5)> GenServer.call pid, :rand
1
iex(6)> GenServer.call pid, :rand
3
iex(7)> GenServer.call pid, :rand
2
iex(8)> pid |> Process.alive?
true
iex(9)> :sys.get_state pid
6

```
