defmodule MyForms.Scrapers.HtmlScraper do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyForms.Scrapers.Website

  schema "html_scrapers" do
    field :xpath, :string
    field :api_url, :string
    field :request_headers, :string
    field :request_body, :string

    belongs_to :website, Website

    timestamps()
  end

  @doc false
  def changeset(html_scraper, attrs) do
    html_scraper
    |> cast(attrs, [:xpath, :api_url, :request_headers, :request_body])
  end
end
