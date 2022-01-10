defmodule TutoPhoenix.Schemas.Trial do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trial" do
    field :name, :string
    belongs_to :championship, TutoPhoenix.Schemas.Championship
    many_to_many :contenders, TutoPhoenix.Schemas.Contender, join_through: "trials_contenders"
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
