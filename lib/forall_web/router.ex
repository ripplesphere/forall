defmodule ForallWeb.Router do
  use ForallWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ForallWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", AboutController, :index
    get "/services", ServicesController, :index
    get "/donate", DonateController, :index
    get "/events", EventsController, :index
    get "/contact", ContactController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ForallWeb do
  #   pipe_through :api
  # end
end
