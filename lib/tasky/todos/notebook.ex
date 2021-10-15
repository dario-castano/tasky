defmodule Tasky.Todos.Notebook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notebooks" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(notebook, attrs) do
    notebook
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
