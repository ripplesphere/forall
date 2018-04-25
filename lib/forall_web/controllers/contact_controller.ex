defmodule ForallWeb.ContactController do
  use ForallWeb, :controller

  alias Forall.Content
  alias Forall.Content.Comment

  def index(conn, %{"message" => message}) do
    changeset = Content.change_comment(%Comment{})
    render(conn, "index.html", changeset: changeset, message: message)
  end

  def index(conn, _params) do
    changeset = Content.change_comment(%Comment{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"comment" => comment_params}) do
    case Content.create_comment(comment_params) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: contact_path(conn, :index, message: "true"))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

  def create(conn, params) do
    render conn, "index.html"
  end
end
