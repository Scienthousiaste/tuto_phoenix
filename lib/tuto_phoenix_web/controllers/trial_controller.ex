defmodule TutoPhoenixWeb.TrialController do
  use TutoPhoenixWeb, :controller
  alias TutoPhoenix.Schemas.Trial
  alias TutoPhoenix.SchemaContexts.Trials
  alias TutoPhoenix.Repo

  def render_new_with_championships(conn, changeset) do
    championships = Repo.all(TutoPhoenix.Schemas.Championship)
    render(conn, "new.html", changeset: changeset, championships: championships)
  end

  def new(conn, _params) do
    changeset = Trial.changeset(%Trial{}, %{})
    render_new_with_championships(conn, changeset)
  end

  def index(conn, _params) do
    trials = Repo.all(Trial)
    render(conn, "index.html", name: "trials", collection: trials)
  end

  def show(conn, %{"id" => id}) do
    trial =
      Trials.get(id)
      |> Trials.preload([:championship])

    render(conn, "show.html", trial: trial)
  end

  def create(conn, %{"trial" => trial_params}) do
    case Trials.create(trial_params) do
      {:ok, trial} ->
        conn
        |> put_flash(:info, "#{trial.name} created!")
        |> redirect(to: Routes.trial_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render_new_with_championships(conn, changeset)
    end
  end
end
