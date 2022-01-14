defmodule TutoPhoenixWeb.TrialView do
  use TutoPhoenixWeb, :view

  def get_championship_options(championships) do
    [
      {"Select the championship for this trial", nil} |
      Enum.map(championships, &({&1.name, &1.id}))
    ]
  end
end
