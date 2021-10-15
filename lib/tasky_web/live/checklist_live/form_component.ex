defmodule TaskyWeb.ChecklistLive.FormComponent do
  use TaskyWeb, :live_component

  alias Tasky.Todos

  @impl true
  def update(%{checklist: checklist} = assigns, socket) do
    changeset = Todos.change_checklist(checklist)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"checklist" => checklist_params}, socket) do
    changeset =
      socket.assigns.checklist
      |> Todos.change_checklist(checklist_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"checklist" => checklist_params}, socket) do
    save_checklist(socket, socket.assigns.action, checklist_params)
  end

  defp save_checklist(socket, :edit, checklist_params) do
    case Todos.update_checklist(socket.assigns.checklist, checklist_params) do
      {:ok, _checklist} ->
        {:noreply,
         socket
         |> put_flash(:info, "Checklist updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_checklist(socket, :new, checklist_params) do
    case Todos.create_checklist(checklist_params) do
      {:ok, _checklist} ->
        {:noreply,
         socket
         |> put_flash(:info, "Checklist created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
