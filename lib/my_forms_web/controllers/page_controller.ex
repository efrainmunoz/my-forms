defmodule MyFormsWeb.PageController do
  use MyFormsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
