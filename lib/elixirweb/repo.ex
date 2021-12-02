defmodule Elixirweb.Repo do
  use Ecto.Repo,
    otp_app: :elixirweb,
    adapter: Ecto.Adapters.Postgres
end
