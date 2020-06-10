defmodule ElixirGroup.Accounts.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :subdomain, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:subdomain])
    |> validate_required([:subdomain])
  end
end
