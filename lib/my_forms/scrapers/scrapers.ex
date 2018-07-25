defmodule MyForms.Scrapers do
  @moduledoc """
  The Scrapers context.
  """

  import Ecto.Query, warn: false
  alias MyForms.Repo

  alias MyForms.Scrapers.{Website, HtmlScraper}

  @doc """
  Returns the list of websites.

  ## Examples

      iex> list_websites()
      [%Website{}, ...]

  """
  def list_websites do
    Website
    |> Repo.all()
    |> Repo.preload(:html_scraper)
  end

  @doc """
  Gets a single website.

  Raises `Ecto.NoResultsError` if the Website does not exist.

  ## Examples

      iex> get_website!(123)
      %Website{}

      iex> get_website!(456)
      ** (Ecto.NoResultsError)

  """
  def get_website!(id) do
    Website
    |> Repo.get!(id)
    |> Repo.preload(:html_scraper)
  end

  @doc """
  Creates a website.

  ## Examples

      iex> create_website(%{field: value})
      {:ok, %Website{}}

      iex> create_website(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_website(attrs \\ %{}) do
    %Website{}
    |> Website.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:html_scraper, with: &HtmlScraper.changeset/2)
    |> Repo.insert()
  end

  @doc """
  Updates a website.

  ## Examples

      iex> update_website(website, %{field: new_value})
      {:ok, %Website{}}

      iex> update_website(website, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_website(%Website{} = website, attrs) do
    website
    |> Website.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:html_scraper, with: &HtmlScraper.changeset/2)
    |> Repo.update()
  end

  @doc """
  Deletes a Website.

  ## Examples

      iex> delete_website(website)
      {:ok, %Website{}}

      iex> delete_website(website)
      {:error, %Ecto.Changeset{}}

  """
  def delete_website(%Website{} = website) do
    Repo.delete(website)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking website changes.

  ## Examples

      iex> change_website(website)
      %Ecto.Changeset{source: %Website{}}

  """
  def change_website(%Website{} = website) do
    Website.changeset(website, %{})
  end

  @doc """
  Returns the list of html_scrapers.

  ## Examples

      iex> list_html_scrapers()
      [%HtmlScraper{}, ...]

  """
  def list_html_scrapers do
    Repo.all(HtmlScraper)
  end

  @doc """
  Gets a single html_scraper.

  Raises `Ecto.NoResultsError` if the Html scraper does not exist.

  ## Examples

      iex> get_html_scraper!(123)
      %HtmlScraper{}

      iex> get_html_scraper!(456)
      ** (Ecto.NoResultsError)

  """
  def get_html_scraper!(id), do: Repo.get!(HtmlScraper, id)

  @doc """
  Creates a html_scraper.

  ## Examples

      iex> create_html_scraper(%{field: value})
      {:ok, %HtmlScraper{}}

      iex> create_html_scraper(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_html_scraper(attrs \\ %{}) do
    %HtmlScraper{}
    |> HtmlScraper.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a html_scraper.

  ## Examples

      iex> update_html_scraper(html_scraper, %{field: new_value})
      {:ok, %HtmlScraper{}}

      iex> update_html_scraper(html_scraper, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_html_scraper(%HtmlScraper{} = html_scraper, attrs) do
    html_scraper
    |> HtmlScraper.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a HtmlScraper.

  ## Examples

      iex> delete_html_scraper(html_scraper)
      {:ok, %HtmlScraper{}}

      iex> delete_html_scraper(html_scraper)
      {:error, %Ecto.Changeset{}}

  """
  def delete_html_scraper(%HtmlScraper{} = html_scraper) do
    Repo.delete(html_scraper)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking html_scraper changes.

  ## Examples

      iex> change_html_scraper(html_scraper)
      %Ecto.Changeset{source: %HtmlScraper{}}

  """
  def change_html_scraper(%HtmlScraper{} = html_scraper) do
    HtmlScraper.changeset(html_scraper, %{})
  end
end
