# Registries

- code: `brother`
- `Registry`: provides a simple key value store that allows proccesses to register themselves using a key

```
iex(2)> Brother.say :parsons
"Working hard, working hard"
iex(3)> Brother.say :julia
"Coffee... that's the stuff"
iex(4)> exports Process
alias/0            alias/1            alive?/1           cancel_timer/1     cancel_timer/2     
delete/1           demonitor/1        demonitor/2        exit/2             flag/2             
flag/3             get/0              get/1              get/2              get_keys/0         
get_keys/1         group_leader/0     group_leader/2     hibernate/3        info/1             
info/2             link/1             list/0             monitor/1          monitor/2          
put/2              read_timer/1       register/2         registered/0       send/3             
send_after/3       send_after/4       sleep/1            spawn/2            spawn/4            
unalias/1          unlink/1           unregister/1       whereis/1          
iex(5)> Process.whereis :julia
#PID<0.140.0>
iex(6)> GenServer.whereis :julia
#PID<0.140.0>

iex(8)> listen = fn -> receive do m -> IO.puts(m) end end
#Function<43.105768164/0 in :erl_eval.expr/6>
iex(9)> pid = spawn listen
#PID<0.168.0>
iex(10)> Process.alive? pid
true
iex(11)> Process.register pid, :catcher
true
iex(12)> :catcher |> Process.alive?
** (ArgumentError) errors were found at the given arguments:

  * 1st argument: not a pid

    :erlang.is_process_alive(:catcher)
iex(12)> :catcher |> Process.whereis |> Process.alive?
true
iex(13)> send :catcher, :ball
ball
:ball
iex(14)> :catcher |> Process.whereis
nil
```