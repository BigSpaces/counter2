defmodule Counter2.Count do
  def get do
    GenServer.call(:counter_server, :get)
  end

  def increment(amount) do
    GenServer.call(:counter_server, {:increment, amount})
  end
end
