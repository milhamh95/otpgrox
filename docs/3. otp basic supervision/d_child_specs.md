# Child spec

- code: `brother`
- child is the children supervisor
- children means child process

```
children = [
      # Starts a worker by calling: Brother.Worker.start_link(arg)
      Brother,
      {Brother, {:winston, "It's not true, so it can't be"}},
      %{
        id: :parsons,
        start: {Brother, :start_link,
         [parsons: "workin hard working hard"]}
      }
    ]
```
[![Brother-Elixir-App](https://i.ibb.co.com/CQB7pcy/Brother-Elixir-App.png)](https://ibb.co.com/6FYPcMS)

