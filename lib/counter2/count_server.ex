defmodule Counter2.Count.CounterServer do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, 0, name: :counter_server)
  end

  @impl true
  def init(count) do
    {:ok, count}
  end

  @impl true
  def handle_call(:get, _from, count) do
    {:reply, count, count}
  end

  @impl true
  def handle_call({:increment, amount}, _from, count) do
    {:reply, count + amount, count + amount}
  end
end
