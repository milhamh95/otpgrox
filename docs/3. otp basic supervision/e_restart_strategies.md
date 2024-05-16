# Restart Strategies

- code: `brother`
- list of strategies
- what needs supervisor to do when the process die

# One for one

- value: `:one_for_one`
- if a child process die, only that process is restarted

```
:julia |> GenServer.whereis |> Process.exit(:exit)
```

# One for all

- value: `:one_for_all`
- if a child process terminate, all other child process terminated as ewll

```
iex(1)> :parsons |> GenServer.whereis |> Process.exit(:exit)
Starting... julia
Starting... parsons
Starting... winston
true
```

- stop the process in reverse order -> winstron, parsons, julia

# Rest for one

- value: `:rest_for_one`
- if a child prosess terminate, it will restart that child process.
- any other child process that depend on the restarted child process, will be restarted as well

```
a b c

if restart a, b and c will be restarted as well
if restart b , c will be restarted as well
if restart c, only c will be restarted

```

---