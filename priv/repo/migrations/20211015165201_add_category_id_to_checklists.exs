defmodule Tasky.Repo.Migrations.AddCategoryIdToChecklists do
  use Ecto.Migration

  def change do
    alter table(:checklists) do
      add(:category_id, references(:categories, on_delete: :delete_all))
    end
  end
end
