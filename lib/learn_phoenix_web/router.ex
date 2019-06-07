defmodule LearnPhoenixWeb.Router do
  use LearnPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LearnPhoenixWeb.Plugs.LoadUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LearnPhoenixWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/contractlist", ContractController, :contractlist
    post "/contractlist", ContractController, :contractlist
    get "/logout", SessionController, :delete
    get "/addcontract", ContractController, :newcontract
    post "/addcontract", ContractController, :createcontract
    get "editcontract/:id", ContractController, :editcontract
    get "viewcontract/:id", ContractController, :viewcontract
    get "deletecontract/:id", ContractController, :deletecontract
    put "updatecontract/:id", ContractController, :updatecontract
    put "deletecontract/:id",ContractController, :deletecontract
  end

  # Other scopes may use custom stacks.
  # scope "/api", LearnPhoenixWeb do
  #   pipe_through :api
  # end
end
