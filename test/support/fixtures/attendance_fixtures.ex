defmodule AttendanceManagement.AttendanceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AttendanceManagement.Attendance` context.
  """

  @doc """
  Generate a school.
  """
  def school_fixture(attrs \\ %{}) do
    {:ok, school} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name"
      })
      |> AttendanceManagement.Attendance.create_school()

    school
  end

  @doc """
  Generate a student.
  """
  def student_fixture(attrs \\ %{}) do
    {:ok, student} =
      attrs
      |> Enum.into(%{
        father_name: "some father_name",
        name: "some name",
        roll_number: "some roll_number"
      })
      |> AttendanceManagement.Attendance.create_student()

    student
  end

  @doc """
  Generate a attendance_record.
  """
  def attendance_record_fixture(attrs \\ %{}) do
    {:ok, attendance_record} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-01-04],
        session: "some session",
        student_id: 42
      })
      |> AttendanceManagement.Attendance.create_attendance_record()

    attendance_record
  end
end
