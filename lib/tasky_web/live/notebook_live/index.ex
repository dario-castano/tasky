defmodule TaskyWeb.NotebookLive.Index do
  use TaskyWeb, :live_view

  alias Tasky.Todos
  alias Tasky.Todos.Notebook

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :notebooks, list_notebooks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Notebook")
    |> assign(:notebook, Todos.get_notebook!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Notebook")
    |> assign(:notebook, %Notebook{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Notebooks")
    |> assign(:notebook, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    notebook = Todos.get_notebook!(id)
    {:ok, _} = Todos.delete_notebook(notebook)

    {:noreply, assign(socket, :notebooks, list_notebooks())}
  end

  defp list_notebooks do
    Todos.list_notebooks()
  end
end
