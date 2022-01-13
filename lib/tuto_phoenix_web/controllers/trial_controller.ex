defmodule TutoPhoenixWeb.TrialController do
  use TutoPhoenixWeb, :controller
  alias TutoPhoenix.Schemas.Trial
  alias TutoPhoenix.SchemaContexts.Trials

  def index(conn, _params) do
    trials = TutoPhoenix.Repo.all(TutoPhoenix.Schemas.Trial)
    render(conn, "index.html", name: "trials", collection: trials)
  end

end
