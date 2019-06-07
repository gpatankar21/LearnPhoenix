defmodule LearnPhoenixWeb.PageController do
  alias LearnPhoenix.CM
  alias LearnPhoenix.CM.Contract
  alias LearnPhoenix.Repo  
  use LearnPhoenixWeb, :controller
  
  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def about(conn, _params) do
    render conn, "about.html"
  end

end
