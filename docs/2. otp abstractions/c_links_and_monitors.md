# c. Links and Monitors
- supervisor -> lifecycle manager

```
iex(1)> spawn_link fn -> raise "Boom" end
** (EXIT from #PID<0.137.0>) shell process exited with reason: an exception was raised:
    ** (RuntimeError) Boom
        (stdlib 5.1) erl_eval.erl:744: :erl_eval.do_apply/7

Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)

04:14:49.085 [error] Process #PID<0.138.0> raised an exception
** (RuntimeError) Boom
    (stdlib 5.1) erl_eval.erl:744: :erl_eval.do_apply/7
iex(1)> seelf
error: undefined variable "seelf"
  iex:1

** (CompileError) cannot compile code (errors have been logged)

iex(1)> self
#PID<0.139.0>
iex(2)> spawn_link fn -> raise "Boom" end
** (EXIT from #PID<0.139.0>) shell process exited with reason: an exception was raised:
    ** (RuntimeError) Boom
        (stdlib 5.1) erl_eval.erl:744: :erl_eval.do_apply/7

04:15:19.117 [error] Process #PID<0.140.0> raised an exception
** (RuntimeError) Boom
    (stdlib 5.1) erl_eval.erl:744: :erl_eval.do_apply/7

Interactive Elixir (1.15.7) - press Ctrl+C to exit (type h() ENTER for help)
iex(2)> flush
:ok
iex(3)> spawn_monitor fn -> raise "Boom" end

04:17:28.117 [error] Process #PID<0.142.0> raised an exception
** (RuntimeError) Boom
    (stdlib 5.1) erl_eval.erl:744: :erl_eval.do_apply/7
{#PID<0.142.0>, #Reference<0.639577272.940834820.118842>}
iex(4)> flush
{:DOWN, #Reference<0.639577272.940834820.118842>, :process, #PID<0.142.0>,
 {%RuntimeError{message: "Boom"},
  [
    {:erl_eval, :do_apply, 7,
     [file: ~c"erl_eval.erl", line: 744, error_info: %{module: Exception}]}
  ]}}
:ok
```