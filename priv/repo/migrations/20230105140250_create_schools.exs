defmodule AttendanceManagement.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :address, :string

      timestamps()
    end
  end
end
