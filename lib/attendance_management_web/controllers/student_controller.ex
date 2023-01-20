defmodule AttendanceManagementWeb.StudentController do
  use AttendanceManagementWeb, :controller

  alias AttendanceManagement.Attendance

  def show(conn, %{"school_id" => school_id}) do
    students = Attendance.get_students_by_school_id(school_id)

    conn
    |> put_status(:ok)
    |> json(%{
      status: true,
      message: "Successfully fetched",
      data: students
    })
  end

  def show(conn, %{"class" => class, "section" => section, "date" => date}) do
    students = Attendance.get_students_by_attendance(date, class, section)

    conn
    |> put_status(:ok)
    |> json(%{
      status: true,
      message: "Successfully fetched1",
      data: students
    })
  end

  def show(conn, %{"class" => class, "section" => section}) do
    students = Attendance.get_students_by_class(class, section)

    conn
    |> put_status(:ok)
    |> json(%{
      status: true,
      message: "Successfully fetched",
      data: students
    })
  end

  def create(
        conn,
        %{
          "name" => _name,
          "roll_number" => _roll_number,
          "school_id" => _school_id
        } = params
      ) do
    case Attendance.create_student(params) do
      {:ok, student} ->
        conn
        |> put_status(:created)
        |> json(%{
          status: true,
          message: "Successfully Student created",
          data: student
        })

      {:error, _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{status: false, message: "Something went to wrong. Please ary again"})
    end
  end
end
