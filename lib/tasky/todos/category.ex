defmodule Tasky.Todos.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :title, :string
    has_many :checklists, Tasky.Todos.Checklist

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
