defmodule AttendanceManagementWeb.SchoolController do
  use AttendanceManagementWeb, :controller

  alias AttendanceManagement.Attendance

  def show(conn, _params) do
    schools = Attendance.list_schools()

    conn
    |> put_status(:ok)
    |> json(%{
      status: true,
      message: "Successfully fetched",
      data: schools
    })
  end

  def create(conn, %{"name" => _name} = params) do
    case Attendance.create_school(params) do
      {:ok, school} ->
        conn
        |> put_status(:created)
        |> json(%{
          status: true,
          message: "Successfully Created School",
          data: school
        })

      {:error, _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{status: false, message: "Something went to wrong. Please ary again"})
    end
  end
end
