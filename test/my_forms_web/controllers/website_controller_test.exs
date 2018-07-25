defmodule MyFormsWeb.WebsiteControllerTest do
  use MyFormsWeb.ConnCase

  alias MyForms.Scrapers

  @create_attrs %{frequency: 42, status: "some status", title: "some title", type: "some type", url: "some url"}
  @update_attrs %{frequency: 43, status: "some updated status", title: "some updated title", type: "some updated type", url: "some updated url"}
  @invalid_attrs %{frequency: nil, status: nil, title: nil, type: nil, url: nil}

  def fixture(:website) do
    {:ok, website} = Scrapers.create_website(@create_attrs)
    website
  end

  describe "index" do
    test "lists all websites", %{conn: conn} do
      conn = get conn, website_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Websites"
    end
  end

  describe "new website" do
    test "renders form", %{conn: conn} do
      conn = get conn, website_path(conn, :new)
      assert html_response(conn, 200) =~ "New Website"
    end
  end

  describe "create website" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, website_path(conn, :create), website: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == website_path(conn, :show, id)

      conn = get conn, website_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Website"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, website_path(conn, :create), website: @invalid_attrs
      assert html_response(conn, 200) =~ "New Website"
    end
  end

  describe "edit website" do
    setup [:create_website]

    test "renders form for editing chosen website", %{conn: conn, website: website} do
      conn = get conn, website_path(conn, :edit, website)
      assert html_response(conn, 200) =~ "Edit Website"
    end
  end

  describe "update website" do
    setup [:create_website]

    test "redirects when data is valid", %{conn: conn, website: website} do
      conn = put conn, website_path(conn, :update, website), website: @update_attrs
      assert redirected_to(conn) == website_path(conn, :show, website)

      conn = get conn, website_path(conn, :show, website)
      assert html_response(conn, 200) =~ "some updated status"
    end

    test "renders errors when data is invalid", %{conn: conn, website: website} do
      conn = put conn, website_path(conn, :update, website), website: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Website"
    end
  end

  describe "delete website" do
    setup [:create_website]

    test "deletes chosen website", %{conn: conn, website: website} do
      conn = delete conn, website_path(conn, :delete, website)
      assert redirected_to(conn) == website_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, website_path(conn, :show, website)
      end
    end
  end

  defp create_website(_) do
    website = fixture(:website)
    {:ok, website: website}
  end
end
