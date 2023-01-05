defmodule AttendanceManagement.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :school_id, references(:schools)
      add :name, :string
      add :father_name, :string
      add :roll_number, :string

      timestamps()
    end

    create unique_index(:students, [:roll_number])
  end
end
