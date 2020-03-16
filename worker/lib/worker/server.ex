defmodule Worker.Server do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def handle_info(%{event: "ping"}, state) do
    Logger.info("pong")
    {:noreply, state}
  end

  def init(_state) do
    WorkerWeb.Endpoint.subscribe("command:delegate", [])
    Logger.debug("Worker server started")
    {:ok, 30}
  end

  defp broadcast(command) do
   WorkerWeb.Endpoint.broadcast!("command:ack", "ack", %{
     ack: command,
   })
  end
end
