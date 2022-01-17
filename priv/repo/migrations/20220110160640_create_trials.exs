defmodule TutoPhoenix.Repo.Migrations.CreateTrials do
  use Ecto.Migration

  def change do
    create table(:trials) do
      add :name, :string
      add :championship_id, references(:championships)
    end
  end
end
