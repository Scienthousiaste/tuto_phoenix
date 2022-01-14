defmodule TutoPhoenix.Schemas.TrialContender do
  use Ecto.Schema

  schema "trials_contenders" do
    field :score, :integer, default: nil

    belongs_to :trials, TutoPhoenix.Schemas.Trial
    belongs_to :contenders, TutoPhoenix.Schemas.Contender
  end

end
