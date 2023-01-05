defmodule AttendanceManagement.Attendance.Student do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> cast(attrs, [:school_id, :name, :father_name, :roll_number])
    |> validate_required([:school_id, :name, :father_name, :roll_number])
    |> unique_constraint(:students_roll_number_index)
  end
end
