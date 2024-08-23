defmodule ElixirGist.Repo.Migrations.CreateCommets do
  use Ecto.Migration

  def change do
    create table(:commets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :markup_text, :text
      add :users_id, references(:users, on_delete: :delete_all, type: :binary_id)
      add :gist_id, references(:gists, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:commets, [:users_id])
    create index(:commets, [:gist_id])
  end
end
