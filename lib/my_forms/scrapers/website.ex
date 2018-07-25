defmodule MyForms.Scrapers.Website do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyForms.Scrapers.HtmlScraper

  schema "websites" do
    field :frequency, :integer, default: 15
    field :status, :string, default: "disabled"
    field :title, :string
    field :type, :string, default: "html"
    field :url, :string
    has_one :html_scraper, HtmlScraper

    timestamps()
  end

  @doc false
  def changeset(website, attrs) do
    website
    |> cast(attrs, [:title, :url, :type, :status, :frequency])
    |> validate_required([:title, :url, :type, :status, :frequency])
  end
end
