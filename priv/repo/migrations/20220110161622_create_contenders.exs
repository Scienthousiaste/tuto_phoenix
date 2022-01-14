defmodule TutoPhoenix.Repo.Migrations.CreateContenders do
  use Ecto.Migration

  def change do
    create table(:contenders) do
      add :name, :string
    end
  end
end
