defmodule TutoPhoenix.Schemas.Championship do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:name, :location]

  schema "championships" do
    field :name, :string, null: false
    field :location, :string, null: false
    has_many :trials, TutoPhoenix.Schemas.Trial, on_delete: :delete_all
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location])
    |> validate_required(@required_fields)
  end
end
