defmodule AttendanceManagement.Attendance.AttendanceRecord do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attendance_records" do
    field :date, :utc_datetime
    field :session, :string

    belongs_to(:student, AttendanceManagement.Attendance.Student)

    timestamps()
  end

  @doc false
  def changeset(attendance_record, attrs) do
    attendance_record
    |> cast(attrs, [:student_id, :date, :session])
    |> validate_required([:student_id, :date, :session])
    |> unique_constraint(:attendance_records_student_id_date_session_index)
  end
end
