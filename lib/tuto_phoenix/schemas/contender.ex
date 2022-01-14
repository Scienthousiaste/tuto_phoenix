defmodule TutoPhoenix.Schemas.Contender do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:name]

  schema "contenders" do
    field :name, :string, null: false
    many_to_many :trials, TutoPhoenix.Schemas.Trial, join_through: "trials_contenders"
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required(@required_fields)
  end
end
