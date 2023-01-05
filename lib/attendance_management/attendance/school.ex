defmodule AttendanceManagement.Attendance.School do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schools" do
    field :address, :string
    field :name, :string

    has_many(:students, AttendanceManagement.Attendance.Student)

    timestamps()
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
