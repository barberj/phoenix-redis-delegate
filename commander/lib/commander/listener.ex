defmodule Commander.Listener do
  use GenServer
  require Logger

  def handle_info(%{event: "ping", payload: payload}, state) do
    Logger.debug("Listener ping")
    {:noreply, state}
  end

  def handle_info(%{event: "ping_a", payload: payload}, state) do
    Logger.debug("Listener ping_a")
    {:noreply, state}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_state) do
    CommanderWeb.Endpoint.subscribe("command:delegate", [])
    CommanderWeb.Endpoint.subscribe("command:chan_a", [])
    Logger.debug("Commander listener started")
    {:ok, %{}}
  end
end
