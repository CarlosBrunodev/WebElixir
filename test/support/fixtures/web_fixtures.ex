defmodule Elixirweb.WebFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Elixirweb.Web` context.
  """

  @doc """
  Generate a lancamento.
  """
  def lancamento_fixture(attrs \\ %{}) do
    {:ok, lancamento} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        tipo: "some tipo",
        valor: 42
      })
      |> Elixirweb.Web.create_lancamento()

    lancamento
  end
end
