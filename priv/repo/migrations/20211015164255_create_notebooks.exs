defmodule Tasky.Repo.Migrations.CreateNotebooks do
  use Ecto.Migration

  def change do
    create table(:notebooks) do
      add :title, :string
      add :description, :text

      timestamps()
    end
  end
end
