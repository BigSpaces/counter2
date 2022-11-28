defmodule Counter2.Repo do
  use Ecto.Repo,
    otp_app: :counter2,
    adapter: Ecto.Adapters.Postgres
end
