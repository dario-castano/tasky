defmodule TaskyWeb.PageController do
  use TaskyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
