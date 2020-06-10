defmodule ElixirGroup.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :subdomain, :string

      timestamps()
    end

  end
end
