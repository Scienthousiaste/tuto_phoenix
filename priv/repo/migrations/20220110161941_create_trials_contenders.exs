defmodule TutoPhoenix.Repo.Migrations.CreateTrialsContenders do
  use Ecto.Migration

  def change do
    create table(:trials_contenders) do
      add :trial_id, references(:trials)
      add :contender_id, references(:contenders)
      add :score, :integer
    end

    create unique_index(:trials_contenders, [:trial_id, :contender_id])
  end
end
