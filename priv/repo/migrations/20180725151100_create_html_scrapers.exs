defmodule MyForms.Repo.Migrations.CreateHtmlScrapers do
  use Ecto.Migration

  def change do
    create table(:html_scrapers) do
      add :xpath, :string
      add :website_id, references(:websites, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:html_scrapers, [:website_id])
  end
end
