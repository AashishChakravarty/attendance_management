defmodule AttendanceManagement.Attendance do
  @moduledoc """
  The Attendance context.
  """

  import Ecto.Query, warn: false
  alias AttendanceManagement.Repo

  alias AttendanceManagement.Attendance.School

  @doc """
  Returns the list of schools.

  ## Examples

      iex> list_schools()
      [%School{}, ...]

  """
  def list_schools do
    Repo.all(School)
  end

  @doc """
  Gets a single school.

  Raises `Ecto.NoResultsError` if the School does not exist.

  ## Examples

      iex> get_school!(123)
      %School{}

      iex> get_school!(456)
      ** (Ecto.NoResultsError)

  """
  def get_school!(id), do: Repo.get!(School, id)

  @doc """
  Creates a school.

  ## Examples

      iex> create_school(%{field: value})
      {:ok, %School{}}

      iex> create_school(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_school(attrs \\ %{}) do
    %School{}
    |> School.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a school.

  ## Examples

      iex> update_school(school, %{field: new_value})
      {:ok, %School{}}

      iex> update_school(school, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_school(%School{} = school, attrs) do
    school
    |> School.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a school.

  ## Examples

      iex> delete_school(school)
      {:ok, %School{}}

      iex> delete_school(school)
      {:error, %Ecto.Changeset{}}

  """
  def delete_school(%School{} = school) do
    Repo.delete(school)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking school changes.

  ## Examples

      iex> change_school(school)
      %Ecto.Changeset{data: %School{}}

  """
  def change_school(%School{} = school, attrs \\ %{}) do
    School.changeset(school, attrs)
  end

  alias AttendanceManagement.Attendance.Student

  @doc """
  Returns the list of students.

  ## Examples

      iex> list_students()
      [%Student{}, ...]

  """
  def list_students do
    Repo.all(Student)
  end

  @doc """
  Gets a single student.

  Raises `Ecto.NoResultsError` if the Student does not exist.

  ## Examples

      iex> get_student!(123)
      %Student{}

      iex> get_student!(456)
      ** (Ecto.NoResultsError)

  """
  def get_student!(id), do: Repo.get!(Student, id)

  @doc """
  Creates a student.

  ## Examples

      iex> create_student(%{field: value})
      {:ok, %Student{}}

      iex> create_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a student.

  ## Examples

      iex> update_student(student, %{field: new_value})
      {:ok, %Student{}}

      iex> update_student(student, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a student.

  ## Examples

      iex> delete_student(student)
      {:ok, %Student{}}

      iex> delete_student(student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking student changes.

  ## Examples

      iex> change_student(student)
      %Ecto.Changeset{data: %Student{}}

  """
  def change_student(%Student{} = student, attrs \\ %{}) do
    Student.changeset(student, attrs)
  end

  alias AttendanceManagement.Attendance.AttendanceRecord

  @doc """
  Returns the list of attendance_records.

  ## Examples

      iex> list_attendance_records()
      [%AttendanceRecord{}, ...]

  """
  def list_attendance_records do
    Repo.all(AttendanceRecord)
  end

  @doc """
  Gets a single attendance_record.

  Raises `Ecto.NoResultsError` if the Attendance record does not exist.

  ## Examples

      iex> get_attendance_record!(123)
      %AttendanceRecord{}

      iex> get_attendance_record!(456)
      ** (Ecto.NoResultsError)

  """
  def get_attendance_record!(id), do: Repo.get!(AttendanceRecord, id)

  @doc """
  Creates a attendance_record.

  ## Examples

      iex> create_attendance_record(%{field: value})
      {:ok, %AttendanceRecord{}}

      iex> create_attendance_record(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attendance_record(attrs \\ %{}) do
    %AttendanceRecord{}
    |> AttendanceRecord.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a attendance_record.

  ## Examples

      iex> update_attendance_record(attendance_record, %{field: new_value})
      {:ok, %AttendanceRecord{}}

      iex> update_attendance_record(attendance_record, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_attendance_record(%AttendanceRecord{} = attendance_record, attrs) do
    attendance_record
    |> AttendanceRecord.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a attendance_record.

  ## Examples

      iex> delete_attendance_record(attendance_record)
      {:ok, %AttendanceRecord{}}

      iex> delete_attendance_record(attendance_record)
      {:error, %Ecto.Changeset{}}

  """
  def delete_attendance_record(%AttendanceRecord{} = attendance_record) do
    Repo.delete(attendance_record)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking attendance_record changes.

  ## Examples

      iex> change_attendance_record(attendance_record)
      %Ecto.Changeset{data: %AttendanceRecord{}}

  """
  def change_attendance_record(%AttendanceRecord{} = attendance_record, attrs \\ %{}) do
    AttendanceRecord.changeset(attendance_record, attrs)
  end

  def get_attendance_record_by_date_student_id(date, student_id) do
    Repo.get_by(AttendanceRecord, date: date, student_id: student_id)
  end

  def get_attendance_records_by_roll_number(roll_number) do
    from(attendance_record in AttendanceRecord,
      join: student in assoc(attendance_record, :student),
      where: student.roll_number == ^roll_number
    )
    |> Repo.all()
  end

  def get_attendance_records_by_date(date, class, section) do
    from(attendance_record in AttendanceRecord,
      join: student in Student,
      on: student.id == attendance_record.student_id,
      where:
        student.class == ^class and student.section == ^section and
          attendance_record.date == ^date
    )
    |> Repo.all()
  end

  def get_students_by_school_id(school_id) do
    from(student in Student,
      where: student.school_id == ^school_id
    )
    |> Repo.all()
  end

  def get_students_by_class(class, section) do
    from(student in Student,
      where: student.class == ^class and student.section == ^section
    )
    |> Repo.all()
  end

  def get_students_by_attendance(date, class, section) do
    from(student in Student,
      left_join: attendance_record in AttendanceRecord,
      on: attendance_record.student_id == student.id and attendance_record.date == ^date,
      where:
        student.class == ^class and student.section == ^section,
      select: %{
        student_id: student.id,
        student_name: student.name,
        roll_number: student.roll_number,
        date: attendance_record.date,
        session: attendance_record.session
      }
    )
    |> Repo.all()
  end

  def mark_absent(students, date, class, section) when is_list(students) do
    attendance_records = get_attendance_records_by_date(date, class, section)

    students
    |> Enum.each(fn student ->
      mark_absent(student, date, attendance_records)
    end)

    attendance_records
    |> Enum.each(fn attendance_record ->
      if is_nil(students |> Enum.find(&(&1["student_id"] == attendance_record.student_id))) do
        delete_attendance_record(attendance_record)
      end
    end)
  end

  def mark_absent(student, date, attendance_records) do
    with %AttendanceRecord{} = attendance_record <-
           Enum.find(attendance_records, &(&1.student_id == student["student_id"])) do
      update_attendance_record(attendance_record, %{session: student["session"]})
    else
      nil ->
        create_attendance_record(%{
          student_id: student["student_id"],
          date: date,
          session: student["session"]
        })
    end
  end
end
