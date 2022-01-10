defmodule TutoPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :tuto_phoenix,
    adapter: Ecto.Adapters.Postgres
end
