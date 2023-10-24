defmodule Gotham.GestionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gotham.Gestion` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Gotham.Gestion.create_user()

    user
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end: ~U[2023-10-23 14:27:00Z],
        start: ~U[2023-10-23 14:27:00Z]
      })
      |> Gotham.Gestion.create_working_time()

    working_time
  end
end
