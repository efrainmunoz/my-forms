defmodule MyForms.ScrapersTest do
  use MyForms.DataCase

  alias MyForms.Scrapers

  describe "websites" do
    alias MyForms.Scrapers.Website

    @valid_attrs %{frequency: 42, status: "some status", title: "some title", type: "some type", url: "some url"}
    @update_attrs %{frequency: 43, status: "some updated status", title: "some updated title", type: "some updated type", url: "some updated url"}
    @invalid_attrs %{frequency: nil, status: nil, title: nil, type: nil, url: nil}

    def website_fixture(attrs \\ %{}) do
      {:ok, website} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scrapers.create_website()

      website
    end

    test "list_websites/0 returns all websites" do
      website = website_fixture()
      assert Scrapers.list_websites() == [website]
    end

    test "get_website!/1 returns the website with given id" do
      website = website_fixture()
      assert Scrapers.get_website!(website.id) == website
    end

    test "create_website/1 with valid data creates a website" do
      assert {:ok, %Website{} = website} = Scrapers.create_website(@valid_attrs)
      assert website.frequency == 42
      assert website.status == "some status"
      assert website.title == "some title"
      assert website.type == "some type"
      assert website.url == "some url"
    end

    test "create_website/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scrapers.create_website(@invalid_attrs)
    end

    test "update_website/2 with valid data updates the website" do
      website = website_fixture()
      assert {:ok, website} = Scrapers.update_website(website, @update_attrs)
      assert %Website{} = website
      assert website.frequency == 43
      assert website.status == "some updated status"
      assert website.title == "some updated title"
      assert website.type == "some updated type"
      assert website.url == "some updated url"
    end

    test "update_website/2 with invalid data returns error changeset" do
      website = website_fixture()
      assert {:error, %Ecto.Changeset{}} = Scrapers.update_website(website, @invalid_attrs)
      assert website == Scrapers.get_website!(website.id)
    end

    test "delete_website/1 deletes the website" do
      website = website_fixture()
      assert {:ok, %Website{}} = Scrapers.delete_website(website)
      assert_raise Ecto.NoResultsError, fn -> Scrapers.get_website!(website.id) end
    end

    test "change_website/1 returns a website changeset" do
      website = website_fixture()
      assert %Ecto.Changeset{} = Scrapers.change_website(website)
    end
  end

  describe "html_scrapers" do
    alias MyForms.Scrapers.HtmlScraper

    @valid_attrs %{xpath: "some xpath"}
    @update_attrs %{xpath: "some updated xpath"}
    @invalid_attrs %{xpath: nil}

    def html_scraper_fixture(attrs \\ %{}) do
      {:ok, html_scraper} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scrapers.create_html_scraper()

      html_scraper
    end

    test "list_html_scrapers/0 returns all html_scrapers" do
      html_scraper = html_scraper_fixture()
      assert Scrapers.list_html_scrapers() == [html_scraper]
    end

    test "get_html_scraper!/1 returns the html_scraper with given id" do
      html_scraper = html_scraper_fixture()
      assert Scrapers.get_html_scraper!(html_scraper.id) == html_scraper
    end

    test "create_html_scraper/1 with valid data creates a html_scraper" do
      assert {:ok, %HtmlScraper{} = html_scraper} = Scrapers.create_html_scraper(@valid_attrs)
      assert html_scraper.xpath == "some xpath"
    end

    test "create_html_scraper/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scrapers.create_html_scraper(@invalid_attrs)
    end

    test "update_html_scraper/2 with valid data updates the html_scraper" do
      html_scraper = html_scraper_fixture()
      assert {:ok, html_scraper} = Scrapers.update_html_scraper(html_scraper, @update_attrs)
      assert %HtmlScraper{} = html_scraper
      assert html_scraper.xpath == "some updated xpath"
    end

    test "update_html_scraper/2 with invalid data returns error changeset" do
      html_scraper = html_scraper_fixture()
      assert {:error, %Ecto.Changeset{}} = Scrapers.update_html_scraper(html_scraper, @invalid_attrs)
      assert html_scraper == Scrapers.get_html_scraper!(html_scraper.id)
    end

    test "delete_html_scraper/1 deletes the html_scraper" do
      html_scraper = html_scraper_fixture()
      assert {:ok, %HtmlScraper{}} = Scrapers.delete_html_scraper(html_scraper)
      assert_raise Ecto.NoResultsError, fn -> Scrapers.get_html_scraper!(html_scraper.id) end
    end

    test "change_html_scraper/1 returns a html_scraper changeset" do
      html_scraper = html_scraper_fixture()
      assert %Ecto.Changeset{} = Scrapers.change_html_scraper(html_scraper)
    end
  end
end
