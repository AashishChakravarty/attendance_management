defmodule AttendanceManagement.Repo.Migrations.UpdateStudentsTable do
  use Ecto.Migration

  def change do
    alter table(:students) do
      add :class, :string
      add :section, :string
    end

    drop(constraint(:students, "students_school_id_fkey"))
  end
end
