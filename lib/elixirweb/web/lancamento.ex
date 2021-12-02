defmodule Elixirweb.Web.Lancamento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lancamento" do
    field :descricao, :string
    field :tipo, :string
    field :valor, :integer

    timestamps()
  end

  @doc false
  def changeset(lancamento, attrs) do
    lancamento
    |> cast(attrs, [:tipo, :descricao, :valor])
    |> validate_required([:tipo, :descricao, :valor])
  end
end
