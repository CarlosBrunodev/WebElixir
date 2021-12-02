defmodule ElixirwebWeb.LancamentoController do
  use ElixirwebWeb, :controller

  alias Elixirweb.Web
  alias Elixirweb.Web.Lancamento

  def index(conn, _params) do
    lancamento = Web.list_lancamento()
    render(conn, "index.html", lancamento: lancamento)
  end

  def new(conn, _params) do
    changeset = Web.change_lancamento(%Lancamento{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lancamento" => lancamento_params}) do
    case Web.create_lancamento(lancamento_params) do
      {:ok, lancamento} ->
        conn
        |> put_flash(:info, "Lancamento created successfully.")
        |> redirect(to: Routes.lancamento_path(conn, :show, lancamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lancamento = Web.get_lancamento!(id)
    render(conn, "show.html", lancamento: lancamento)
  end

  def edit(conn, %{"id" => id}) do
    lancamento = Web.get_lancamento!(id)
    changeset = Web.change_lancamento(lancamento)
    render(conn, "edit.html", lancamento: lancamento, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lancamento" => lancamento_params}) do
    lancamento = Web.get_lancamento!(id)

    case Web.update_lancamento(lancamento, lancamento_params) do
      {:ok, lancamento} ->
        conn
        |> put_flash(:info, "Lancamento updated successfully.")
        |> redirect(to: Routes.lancamento_path(conn, :show, lancamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lancamento: lancamento, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lancamento = Web.get_lancamento!(id)
    {:ok, _lancamento} = Web.delete_lancamento(lancamento)

    conn
    |> put_flash(:info, "Lancamento deleted successfully.")
    |> redirect(to: Routes.lancamento_path(conn, :index))
  end
end
