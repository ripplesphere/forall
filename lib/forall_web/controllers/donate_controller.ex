defmodule ForallWeb.DonateController do
  use ForallWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", status: "donate"
  end

  def thanks(conn, _params) do
    render conn, "index.html", status: "thanks"
  end
end
