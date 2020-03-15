defmodule Commander.Server do
  use GenServer
  require Logger

  def ping() do
    GenServer.cast(__MODULE__, :ping)
  end

  def handle_cast(:ping, state) do
    Logger.debug("ping")
    broadcast("ping")

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
