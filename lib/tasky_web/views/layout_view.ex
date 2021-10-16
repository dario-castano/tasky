defmodule TaskyWeb.LayoutView do
  use TaskyWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def home_page?(conn) do
    cond do
      isa_liveview?(conn) -> false
      home_route?(conn) -> true
      true -> false
    end
  end

  defp isa_liveview?(conn) do
    Map.has_key?(conn.private, :phoenix_live_view)
  end

  defp home_route?(conn) do
    phx_controller = conn.private.phoenix_controller == TaskyWeb.PageController
    phx_template = conn.private.phoenix_template == "index.html"
    phx_controller && phx_template
  end
end
