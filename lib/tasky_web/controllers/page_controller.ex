defmodule TaskyWeb.PageController do
  use TaskyWeb, :controller

  def index(conn, _params) do
    current_user = conn.assigns.current_user

    if current_user do
      redirect(conn, to: "/notebooks")
    else
      render(conn, "index.html")
    end
  end
end
