defmodule TutoPhoenix.Repo.Migrations.AddIndexToTrials do
  use Ecto.Migration

  def change do
    create index(:trials, [:championship_id])
  end
end
