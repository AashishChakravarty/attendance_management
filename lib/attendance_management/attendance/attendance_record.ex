defmodule AttendanceManagement.Attendance.AttendanceRecord do
  use Ecto.Schema
  import Ecto.Changeset

  @required ~W(student_id date session)a
  @optional ~W(id)a
  @only @required ++ @optional

  @derive {Jason.Encoder, only: @only}
  schema "attendance_records" do
    field :student_id, :integer
    field :date, :utc_datetime
    field :session, :string

    timestamps()
  end

  @doc false
  def changeset(attendance_record, attrs) do
    attendance_record
    |> cast(attrs, @only)
    |> validate_required(@required)
    |> unique_constraint(:attendance_records_student_id_date_session_index)
  end
end
