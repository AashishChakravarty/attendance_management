defmodule AttendanceManagement.Attendance.Student do
  use Ecto.Schema
  import Ecto.Changeset

  @required ~W(school_id name roll_number)a
  @optional ~W(id father_name)a
  @only @required ++ @optional

  @derive {Jason.Encoder, only: @only}
  schema "students" do
    field :father_name, :string
    field :name, :string
    field :roll_number, :string

    belongs_to(:school, AttendanceManagement.Attendance.School)
    has_many(:attendance, AttendanceManagement.Attendance.AttendanceRecord)

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, @only)
    |> validate_required(@required)
    |> unique_constraint(:students_roll_number_index)
  end
end
