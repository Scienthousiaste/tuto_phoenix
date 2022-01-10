defmodule TutoPhoenix.Schemas.TrialContender do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trials_contenders" do
    field :name, :string
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
