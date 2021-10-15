defmodule Tasky.Todos.Checklist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checklists" do
    field :name, :string
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(checklist, attrs) do
    checklist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
