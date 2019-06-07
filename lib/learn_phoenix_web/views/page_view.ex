defmodule LearnPhoenixWeb.PageView do
  use LearnPhoenixWeb, :view
  def render("about.html", _)do
    {:safe, """
    <html>
    <body>
    <h1>This is function about page</h1>
    </body>
    </html>
    """
  }
  end
end
