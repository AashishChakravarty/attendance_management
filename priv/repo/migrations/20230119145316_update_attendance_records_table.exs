defmodule AttendanceManagement.Repo.Migrations.UpdateAttendanceRecordsTable do
  use Ecto.Migration

  def change do
    alter table(:attendance_records) do
      modify :date, :date
    end

    drop(constraint(:attendance_records, "attendance_records_student_id_fkey"))
  end
end
