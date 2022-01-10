defmodule TutoPhoenix.Schemas.Contender do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contenders" do
    field :name, :string
    many_to_many :trials, TutoPhoenix.Schemas.Trial, join_through: "trials_contenders"
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
