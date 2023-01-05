defmodule AttendanceManagement.AttendanceTest do
  use AttendanceManagement.DataCase

  alias AttendanceManagement.Attendance

  describe "schools" do
    alias AttendanceManagement.Attendance.School

    import AttendanceManagement.AttendanceFixtures

    @invalid_attrs %{address: nil, name: nil}

    test "list_schools/0 returns all schools" do
      school = school_fixture()
      assert Attendance.list_schools() == [school]
    end

    test "get_school!/1 returns the school with given id" do
      school = school_fixture()
      assert Attendance.get_school!(school.id) == school
    end

    test "create_school/1 with valid data creates a school" do
      valid_attrs = %{address: "some address", name: "some name"}

      assert {:ok, %School{} = school} = Attendance.create_school(valid_attrs)
      assert school.address == "some address"
      assert school.name == "some name"
    end

    test "create_school/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attendance.create_school(@invalid_attrs)
    end

    test "update_school/2 with valid data updates the school" do
      school = school_fixture()
      update_attrs = %{address: "some updated address", name: "some updated name"}

      assert {:ok, %School{} = school} = Attendance.update_school(school, update_attrs)
      assert school.address == "some updated address"
      assert school.name == "some updated name"
    end

    test "update_school/2 with invalid data returns error changeset" do
      school = school_fixture()
      assert {:error, %Ecto.Changeset{}} = Attendance.update_school(school, @invalid_attrs)
      assert school == Attendance.get_school!(school.id)
    end

    test "delete_school/1 deletes the school" do
      school = school_fixture()
      assert {:ok, %School{}} = Attendance.delete_school(school)
      assert_raise Ecto.NoResultsError, fn -> Attendance.get_school!(school.id) end
    end

    test "change_school/1 returns a school changeset" do
      school = school_fixture()
      assert %Ecto.Changeset{} = Attendance.change_school(school)
    end
  end

  describe "students" do
    alias AttendanceManagement.Attendance.Student

    import AttendanceManagement.AttendanceFixtures

    @invalid_attrs %{father_name: nil, name: nil, roll_number: nil}

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert Attendance.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Attendance.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      valid_attrs = %{father_name: "some father_name", name: "some name", roll_number: "some roll_number"}

      assert {:ok, %Student{} = student} = Attendance.create_student(valid_attrs)
      assert student.father_name == "some father_name"
      assert student.name == "some name"
      assert student.roll_number == "some roll_number"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attendance.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      update_attrs = %{father_name: "some updated father_name", name: "some updated name", roll_number: "some updated roll_number"}

      assert {:ok, %Student{} = student} = Attendance.update_student(student, update_attrs)
      assert student.father_name == "some updated father_name"
      assert student.name == "some updated name"
      assert student.roll_number == "some updated roll_number"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Attendance.update_student(student, @invalid_attrs)
      assert student == Attendance.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Attendance.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Attendance.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Attendance.change_student(student)
    end
  end

  describe "attendance_records" do
    alias AttendanceManagement.Attendance.AttendanceRecord

    import AttendanceManagement.AttendanceFixtures

    @invalid_attrs %{date: nil, session: nil, student_id: nil}

    test "list_attendance_records/0 returns all attendance_records" do
      attendance_record = attendance_record_fixture()
      assert Attendance.list_attendance_records() == [attendance_record]
    end

    test "get_attendance_record!/1 returns the attendance_record with given id" do
      attendance_record = attendance_record_fixture()
      assert Attendance.get_attendance_record!(attendance_record.id) == attendance_record
    end

    test "create_attendance_record/1 with valid data creates a attendance_record" do
      valid_attrs = %{date: ~D[2023-01-04], session: "some session", student_id: 42}

      assert {:ok, %AttendanceRecord{} = attendance_record} = Attendance.create_attendance_record(valid_attrs)
      assert attendance_record.date == ~D[2023-01-04]
      assert attendance_record.session == "some session"
      assert attendance_record.student_id == 42
    end

    test "create_attendance_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attendance.create_attendance_record(@invalid_attrs)
    end

    test "update_attendance_record/2 with valid data updates the attendance_record" do
      attendance_record = attendance_record_fixture()
      update_attrs = %{date: ~D[2023-01-05], session: "some updated session", student_id: 43}

      assert {:ok, %AttendanceRecord{} = attendance_record} = Attendance.update_attendance_record(attendance_record, update_attrs)
      assert attendance_record.date == ~D[2023-01-05]
      assert attendance_record.session == "some updated session"
      assert attendance_record.student_id == 43
    end

    test "update_attendance_record/2 with invalid data returns error changeset" do
      attendance_record = attendance_record_fixture()
      assert {:error, %Ecto.Changeset{}} = Attendance.update_attendance_record(attendance_record, @invalid_attrs)
      assert attendance_record == Attendance.get_attendance_record!(attendance_record.id)
    end

    test "delete_attendance_record/1 deletes the attendance_record" do
      attendance_record = attendance_record_fixture()
      assert {:ok, %AttendanceRecord{}} = Attendance.delete_attendance_record(attendance_record)
      assert_raise Ecto.NoResultsError, fn -> Attendance.get_attendance_record!(attendance_record.id) end
    end

    test "change_attendance_record/1 returns a attendance_record changeset" do
      attendance_record = attendance_record_fixture()
      assert %Ecto.Changeset{} = Attendance.change_attendance_record(attendance_record)
    end
  end
end
