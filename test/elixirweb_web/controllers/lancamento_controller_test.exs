defmodule ElixirwebWeb.LancamentoControllerTest do
  use ElixirwebWeb.ConnCase

  import Elixirweb.WebFixtures

  @create_attrs %{descricao: "some descricao", tipo: "some tipo", valor: 42}
  @update_attrs %{descricao: "some updated descricao", tipo: "some updated tipo", valor: 43}
  @invalid_attrs %{descricao: nil, tipo: nil, valor: nil}

  describe "index" do
    test "lists all lancamento", %{conn: conn} do
      conn = get(conn, Routes.lancamento_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Lancamento"
    end
  end

  describe "new lancamento" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.lancamento_path(conn, :new))
      assert html_response(conn, 200) =~ "New Lancamento"
    end
  end

  describe "create lancamento" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.lancamento_path(conn, :create), lancamento: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.lancamento_path(conn, :show, id)

      conn = get(conn, Routes.lancamento_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Lancamento"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.lancamento_path(conn, :create), lancamento: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Lancamento"
    end
  end

  describe "edit lancamento" do
    setup [:create_lancamento]

    test "renders form for editing chosen lancamento", %{conn: conn, lancamento: lancamento} do
      conn = get(conn, Routes.lancamento_path(conn, :edit, lancamento))
      assert html_response(conn, 200) =~ "Edit Lancamento"
    end
  end

  describe "update lancamento" do
    setup [:create_lancamento]

    test "redirects when data is valid", %{conn: conn, lancamento: lancamento} do
      conn = put(conn, Routes.lancamento_path(conn, :update, lancamento), lancamento: @update_attrs)
      assert redirected_to(conn) == Routes.lancamento_path(conn, :show, lancamento)

      conn = get(conn, Routes.lancamento_path(conn, :show, lancamento))
      assert html_response(conn, 200) =~ "some updated descricao"
    end

    test "renders errors when data is invalid", %{conn: conn, lancamento: lancamento} do
      conn = put(conn, Routes.lancamento_path(conn, :update, lancamento), lancamento: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Lancamento"
    end
  end

  describe "delete lancamento" do
    setup [:create_lancamento]

    test "deletes chosen lancamento", %{conn: conn, lancamento: lancamento} do
      conn = delete(conn, Routes.lancamento_path(conn, :delete, lancamento))
      assert redirected_to(conn) == Routes.lancamento_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.lancamento_path(conn, :show, lancamento))
      end
    end
  end

  defp create_lancamento(_) do
    lancamento = lancamento_fixture()
    %{lancamento: lancamento}
  end
end
