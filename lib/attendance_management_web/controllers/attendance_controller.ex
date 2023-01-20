defmodule AttendanceManagementWeb.AttendanceController do
  use AttendanceManagementWeb, :controller

  alias AttendanceManagement.Attendance

  def show(conn, %{"roll_number" => roll_number}) do
    attendance_records = Attendance.get_attendance_records_by_roll_number(roll_number)

    conn
    |> put_status(:ok)
    |> json(%{
      status: true,
      message: "Successfully fetched",
      data: attendance_records
    })
  end

  def create(conn, %{"date" => date, "student_id" => student_id} = params) do
    session = get_in(params, ["session"])

    session =
      if session == nil do
        "BOTH"
      else
        session
      end

    attrs = %{
      student_id: student_id,
      date: date,
      session: session
    }

    case Attendance.create_attendance_record(attrs) do
      {:ok, attendance_record} ->
        conn
        |> put_status(:created)
        |> json(%{
          status: true,
          message: "Successfully Marked Attendance.",
          data: attendance_record
        })

      {:error, _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{status: false, message: "Something went to wrong. Please ary again"})
    end
  end

  def create(conn, %{
        "date" => date,
        "class" => class,
        "section" => section,
        "students" => students
      }) do
    case Attendance.mark_absent(students, date, class, section) do
      :ok ->
        conn
        |> put_status(:created)
        |> json(%{
          status: true,
          message: "Successfully Marked Attendance."
        })

      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{status: false, message: "Something went to wrong. Please ary again"})
    end
  end
end
