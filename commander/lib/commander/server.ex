defmodule Commander.Server do
  use GenServer
  require Logger

  def ping() do
    GenServer.cast(__MODULE__, :ping)
  end

  def ping_a() do
    GenServer.cast(__MODULE__, :ping_a)
  end

  def ping_b() do
    GenServer.cast(__MODULE__, :ping_b)
  end

  def handle_cast(:ping, state) do
    Logger.debug("ping")
    broadcast("ping")

    {:noreply, state}
  end

  def handle_cast(:ping_a, state) do
    Logger.debug("ping_a")
    CommanderWeb.Endpoint.broadcast!("command:chan_a", "ping_a", %{
      command: "ping_a"
    })

    {:noreply, state}
  end

  def handle_cast(:ping_b, state) do
    Logger.debug("ping_b")
    CommanderWeb.Endpoint.broadcast!("command:chan_b", "ping_b", %{
      command: "ping_b"
    })

    {:noreply, state}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_state) do
    Logger.debug("Commander server started")
    {:ok, %{}}
  end

  defp broadcast(command) do
    CommanderWeb.Endpoint.broadcast!("command:delegate", command, %{
      command: command
    })
  end
end
