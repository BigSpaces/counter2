defmodule Counter2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Counter2.Repo,
      # Start the Telemetry supervisor
      Counter2Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Counter2.PubSub},
      # Start the Endpoint (http/https)
      Counter2Web.Endpoint,
      # Start a worker by calling: Counter2.Worker.start_link(arg)
      # {Counter2.Worker, arg}
      {Counter2.Count.CounterServer, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Counter2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Counter2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
