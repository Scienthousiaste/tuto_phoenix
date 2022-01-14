defmodule TutoPhoenixWeb.ChampionshipController do
  use TutoPhoenixWeb, :controller
  alias TutoPhoenix.Schemas.Championship
  alias TutoPhoenix.SchemaContexts.Championships

  def new(conn, _params) do
    changeset = Championship.changeset(%Championship{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    championships = TutoPhoenix.Repo.all(TutoPhoenix.Schemas.Championship)
    render(conn, "index.html", name: "championships", collection: championships)
  end

  def show(conn, %{"id" => id}) do
    championship = Championships.get(id)
    render(conn, "show.html", championship: championship)
  end

  def create(conn, %{"championship" => championship_params}) do
    case Championships.create(championship_params) do
      {:ok, championship} -> conn
        |> put_flash(:info, "#{championship.name} created!")
        |> redirect(to: Routes.championship_path(conn, :index))
      {:error,  %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
