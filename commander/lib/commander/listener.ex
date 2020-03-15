defmodule Commander.Listener do
  use GenServer
  require Logger

  def handle_info(%{event: "ping", payload: payload}, state) do
    Logger.debug("Listener ping")
    {:noreply, state}
  end


  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_state) do
    CommanderWeb.Endpoint.subscribe("command:delegate", [])
    Logger.debug("Commander server b started")
    {:ok, %{}}
  end
end
