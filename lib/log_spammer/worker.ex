defmodule LogSpammer.Worker do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    set_timer()

    {:ok, nil}
  end

  def handle_info(:timer, state) do
    Logger.info("Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...")

    set_timer()
    {:noreply, state}
  end


  defp set_timer do
    Process.send_after(self(), :timer, 10)
  end
end
