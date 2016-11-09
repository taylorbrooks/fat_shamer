defmodule FatShamer.Router do
  use FatShamer.Web, :router

  pipeline :shame do
    plug :accepts, ["json"]
  end

  scope "/", FatShamer do
    pipe_through :shame

    post "/message", MessageController, :create
  end

end
