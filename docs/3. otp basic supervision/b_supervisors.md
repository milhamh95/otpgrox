# 3. Supervisors

- supervisors is a tool to monitor process so it can automatic restart the process again
- genserver is a tool to manage state and communicate with each process
- code: `brother`

```
iex(1)> :sup |> GenServer.whereis
#PID<0.138.0>
iex(2)> :sup |> GenServer.whereis |> Process.alive?
true
iex(3)> Supervisor.which_children :sup
[]
```

```
iex(1)> :sup |> GenServer.whereis
#PID<0.126.0>
iex(2)> Supervisor.which_children :sup
[{Brother, #PID<0.127.0>, :worker, [Brother]}]
iex(3)> :big |> GenServer.whereis
#PID<0.127.0>
iex(4)> Process.exit(v(3), :big_brother_is_watching)
Starting...
true
iex(5)> Supervisor.which_children :sup
[{Brother, #PID<0.139.0>, :worker, [Brother]}]
iex(6)> v(3)
#PID<0.127.0>
iex(7)> v(3) |> Process.alive?
false
iex(8)> :big |> GenServer.whereis
#PID<0.139.0>
iex(9)> 
```