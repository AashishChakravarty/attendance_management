defmodule AttendanceManagement.Attendance.School do
  use Ecto.Schema
  import Ecto.Changeset

  @required ~W(name)a
  @optional ~W(id address)a
  @only @required ++ @optional

  @derive {Jason.Encoder, only: @only}
  schema "schools" do
    field :address, :string
    field :name, :string

    has_many(:students, AttendanceManagement.Attendance.Student)

    timestamps()
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, @only)
    |> validate_required(@required)
  end
end
