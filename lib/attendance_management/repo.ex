defmodule AttendanceManagement.Repo do
  use Ecto.Repo,
    otp_app: :attendance_management,
    adapter: Ecto.Adapters.Postgres
end
