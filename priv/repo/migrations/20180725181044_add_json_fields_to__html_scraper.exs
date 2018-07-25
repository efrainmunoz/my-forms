defmodule MyForms.Repo.Migrations.AddJsonFieldsTo_HtmlScraper do
  use Ecto.Migration

  def change do
    alter table(:html_scrapers) do
      modify :xpath, :text
      add :api_url, :text
      add :request_headers, :text
      add :request_body, :text
    end
  end
end
