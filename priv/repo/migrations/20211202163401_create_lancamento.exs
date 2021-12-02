defmodule Elixirweb.Repo.Migrations.CreateLancamento do
  use Ecto.Migration

  def change do
    create table(:lancamento) do
      add :tipo, :string
      add :descricao, :string
      add :valor, :integer

      timestamps()
    end
  end
end
