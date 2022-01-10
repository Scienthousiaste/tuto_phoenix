defmodule TutoPhoenix.Schemas.Championship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "championship" do
    field :name, :string
    field :location, :string
    has_many :trials, TutoPhoenix.Schemas.Trial
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :location])
    |> validate_required([:name])
    |> validate_required([:location])
  end
end
