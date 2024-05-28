defmodule Brother.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Brother.Worker.start_link(arg)
      {DynamicSupervisor, name: :dsup},
      {Registry, keys: :unique, name: :reg},
      {Brother, {:julia, "Coffee... that's the stuff"}},
      {Brother, {:parsons, "Working hard, working hard"}},
      {Brother, {:winston, "It's not true, so it can't be"}},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: :sup]
    Supervisor.start_link(children, opts)
  end
end
