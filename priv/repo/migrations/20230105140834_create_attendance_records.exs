defmodule AttendanceManagement.Repo.Migrations.CreateAttendanceRecords do
  use Ecto.Migration

  def change do
    create table(:attendance_records) do
      add :student_id, references(:students)
      add :date, :utc_datetime
      add :session, :string

      timestamps()
    end

    create unique_index(:attendance_records, [:student_id, :date, :session])
  end
end
