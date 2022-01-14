defmodule TutoPhoenixWeb.ContenderController do
  use TutoPhoenixWeb, :controller
  alias TutoPhoenix.Schemas.Contender
  alias TutoPhoenix.SchemaContexts.Contenders

  def index(conn, _params) do
    contenders = TutoPhoenix.Repo.all(TutoPhoenix.Schemas.Contender)
    render(conn, "index.html", name: "contenders", collection: contenders)
  end

  def new(conn, _params) do
    changeset = Contender.changeset(%Contender{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    contender = Contenders.get(id)
      |> Contenders.preload([:trials])
    render(conn, "show.html", contender: contender)
  end

  def create(conn, %{"contender" => contender_params}) do
    case Contenders.create(contender_params) do
      {:ok, contender} -> conn
        |> put_flash(:info, "#{contender.name} created!")
        |> redirect(to: Routes.contender_path(conn, :index))
      {:error,  %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
