defmodule ForallWeb.ServicesController do
  use ForallWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
