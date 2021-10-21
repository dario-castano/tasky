defmodule Tasky.Todos.Checklist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checklists" do
    field :name, :string
    belongs_to :category, Tasky.Todos.Category

    timestamps()
  end

  @doc false
  def changeset(checklist, attrs) do
    checklist
    |> cast(attrs, [:name])
    |> cast_assoc(:category, required: true)
    |> validate_required([:name])
  end
end
