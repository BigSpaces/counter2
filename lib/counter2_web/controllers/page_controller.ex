defmodule Counter2Web.PageController do
  use Counter2Web, :controller

  def index(conn, _params) do
    count = Counter2.Count.get()
    render(conn, count: count)
  end

  def update(conn, _params) do
    increment =
      case Integer.parse(conn.params["increment"]) do
        {integer, _remainder_of_binary} -> integer
        _ -> 1
      end

    Counter2.Count.increment(increment)
    redirect(conn, to: "/")
  end
end
