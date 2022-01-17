defmodule TutoPhoenix.Repo.Migrations.CreateChampionships do
  use Ecto.Migration

  def change do
    create table(:championships) do
      add :name, :string
      add :location, :string
    end
  end
end
