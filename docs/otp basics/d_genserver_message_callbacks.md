# Gen Server Message Callback

- code repo -> rememberall

```
iex(3)> Rememberall.start_link(:red)
{:ok, #PID<0.176.0>}
iex(4)> Rememberall.get
:red
iex(5)> Rememberall.set(:green)
:ok
iex(6)> Rememberall.say
The value is green
:say
iex(7)> 
```