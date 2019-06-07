defmodule LearnPhoenixWeb.PageController do
  use LearnPhoenixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def about(conn, _params) do
    render conn, "about.html"
  end
  def contractlist(conn, _params) do
    render conn, "contractlist.html"
  end
end
