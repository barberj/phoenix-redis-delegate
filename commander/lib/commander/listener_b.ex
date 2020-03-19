defmodule Commander.ListenerB do
  use GenServer
  require Logger

  def handle_info(%{event: "ping", payload: payload}, state) do
    Logger.debug("Listener B ping")
    {:noreply, state}
  end

  def handle_info(%{event: "ping_b", payload: payload}, state) do
    Logger.debug("Listener B ping_b")
    {:noreply, state}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_state) do
    CommanderWeb.Endpoint.subscribe("command:delegate", [])
    CommanderWeb.Endpoint.subscribe("command:chan_b", [])
    Logger.debug("Commander listener b started")
    {:ok, %{}}
  end
end
