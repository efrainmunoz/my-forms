defmodule MyForms.Repo.Migrations.CreateWebsites do
  use Ecto.Migration

  def change do
    create table(:websites) do
      add :title, :string
      add :url, :string
      add :type, :string
      add :status, :string
      add :frequency, :integer

      timestamps()
    end

  end
end
