defmodule TutoPhoenixWeb.PageController do
  use TutoPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
