# Dynamic Supervisors

- code: `brother`
- dynamic supervisors: supervisors that can process on the fly

```
ex(1)> Supervisor.which_children :sup
[{:dsup, #PID<0.139.0>, :supervisor, [DynamicSupervisor]}]
iex(2)> DynamicSupervisor.start_child :dsup, {Brother, {:julia, "Coffee... that's the stuff"}}
Starting... julia
{:ok, #PID<0.151.0>}

iex(4)> Brother.start_child {:parsons, "Working hard, working hard"}
Starting... parsons
{:ok, #PID<0.165.0>}
iex(5)> Supervisor.which_children :sup
[{:dsup, #PID<0.139.0>, :supervisor, [DynamicSupervisor]}]
iex(6)> Supervisor.which_children :dsup
[
  {:undefined, #PID<0.151.0>, :worker, [Brother]},
  {:undefined, #PID<0.165.0>, :worker, [Brother]}
]
```