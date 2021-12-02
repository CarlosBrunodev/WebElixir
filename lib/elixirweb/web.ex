defmodule Elixirweb.Web do
  @moduledoc """
  The Web context.
  """

  import Ecto.Query, warn: false
  alias Elixirweb.Repo

  alias Elixirweb.Web.Lancamento

  @doc """
  Returns the list of lancamento.

  ## Examples

      iex> list_lancamento()
      [%Lancamento{}, ...]

  """
  def list_lancamento do
    Repo.all(Lancamento)
  end

  @doc """
  Gets a single lancamento.

  Raises `Ecto.NoResultsError` if the Lancamento does not exist.

  ## Examples

      iex> get_lancamento!(123)
      %Lancamento{}

      iex> get_lancamento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lancamento!(id), do: Repo.get!(Lancamento, id)

  @doc """
  Creates a lancamento.

  ## Examples

      iex> create_lancamento(%{field: value})
      {:ok, %Lancamento{}}

      iex> create_lancamento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lancamento(attrs \\ %{}) do
    %Lancamento{}
    |> Lancamento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lancamento.

  ## Examples

      iex> update_lancamento(lancamento, %{field: new_value})
      {:ok, %Lancamento{}}

      iex> update_lancamento(lancamento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lancamento(%Lancamento{} = lancamento, attrs) do
    lancamento
    |> Lancamento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lancamento.

  ## Examples

      iex> delete_lancamento(lancamento)
      {:ok, %Lancamento{}}

      iex> delete_lancamento(lancamento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lancamento(%Lancamento{} = lancamento) do
    Repo.delete(lancamento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lancamento changes.

  ## Examples

      iex> change_lancamento(lancamento)
      %Ecto.Changeset{data: %Lancamento{}}

  """
  def change_lancamento(%Lancamento{} = lancamento, attrs \\ %{}) do
    Lancamento.changeset(lancamento, attrs)
  end
end
