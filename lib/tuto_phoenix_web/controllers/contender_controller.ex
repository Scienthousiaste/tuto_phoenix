defmodule TutoPhoenixWeb.ContenderController do
  use TutoPhoenixWeb, :controller
  alias TutoPhoenix.Schemas.Contender
  alias TutoPhoenix.SchemaContexts.Contenders

  def index(conn, _params) do
    contenders = TutoPhoenix.Repo.all(TutoPhoenix.Schemas.Contender)
    render(conn, "index.html", name: "contenders", collection: contenders)
  end

end
