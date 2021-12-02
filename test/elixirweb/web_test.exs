defmodule Elixirweb.WebTest do
  use Elixirweb.DataCase

  alias Elixirweb.Web

  describe "lancamento" do
    alias Elixirweb.Web.Lancamento

    import Elixirweb.WebFixtures

    @invalid_attrs %{descricao: nil, tipo: nil, valor: nil}

    test "list_lancamento/0 returns all lancamento" do
      lancamento = lancamento_fixture()
      assert Web.list_lancamento() == [lancamento]
    end

    test "get_lancamento!/1 returns the lancamento with given id" do
      lancamento = lancamento_fixture()
      assert Web.get_lancamento!(lancamento.id) == lancamento
    end

    test "create_lancamento/1 with valid data creates a lancamento" do
      valid_attrs = %{descricao: "some descricao", tipo: "some tipo", valor: 42}

      assert {:ok, %Lancamento{} = lancamento} = Web.create_lancamento(valid_attrs)
      assert lancamento.descricao == "some descricao"
      assert lancamento.tipo == "some tipo"
      assert lancamento.valor == 42
    end

    test "create_lancamento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Web.create_lancamento(@invalid_attrs)
    end

    test "update_lancamento/2 with valid data updates the lancamento" do
      lancamento = lancamento_fixture()
      update_attrs = %{descricao: "some updated descricao", tipo: "some updated tipo", valor: 43}

      assert {:ok, %Lancamento{} = lancamento} = Web.update_lancamento(lancamento, update_attrs)
      assert lancamento.descricao == "some updated descricao"
      assert lancamento.tipo == "some updated tipo"
      assert lancamento.valor == 43
    end

    test "update_lancamento/2 with invalid data returns error changeset" do
      lancamento = lancamento_fixture()
      assert {:error, %Ecto.Changeset{}} = Web.update_lancamento(lancamento, @invalid_attrs)
      assert lancamento == Web.get_lancamento!(lancamento.id)
    end

    test "delete_lancamento/1 deletes the lancamento" do
      lancamento = lancamento_fixture()
      assert {:ok, %Lancamento{}} = Web.delete_lancamento(lancamento)
      assert_raise Ecto.NoResultsError, fn -> Web.get_lancamento!(lancamento.id) end
    end

    test "change_lancamento/1 returns a lancamento changeset" do
      lancamento = lancamento_fixture()
      assert %Ecto.Changeset{} = Web.change_lancamento(lancamento)
    end
  end
end
