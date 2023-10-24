defmodule Gotham.GestionTest do
  use Gotham.DataCase

  alias Gotham.Gestion

  describe "users" do
    alias Gotham.Gestion.User

    import Gotham.GestionFixtures

    @invalid_attrs %{username: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Gestion.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Gestion.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{username: "some username", email: "some email"}

      assert {:ok, %User{} = user} = Gestion.create_user(valid_attrs)
      assert user.username == "some username"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gestion.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{username: "some updated username", email: "some updated email"}

      assert {:ok, %User{} = user} = Gestion.update_user(user, update_attrs)
      assert user.username == "some updated username"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Gestion.update_user(user, @invalid_attrs)
      assert user == Gestion.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Gestion.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Gestion.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Gestion.change_user(user)
    end
  end

  describe "working_times" do
    alias Gotham.Gestion.WorkingTime

    import Gotham.GestionFixtures

    @invalid_attrs %{start: nil, end: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Gestion.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Gestion.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start: ~U[2023-10-23 14:27:00Z], end: ~U[2023-10-23 14:27:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Gestion.create_working_time(valid_attrs)
      assert working_time.start == ~U[2023-10-23 14:27:00Z]
      assert working_time.end == ~U[2023-10-23 14:27:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gestion.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start: ~U[2023-10-24 14:27:00Z], end: ~U[2023-10-24 14:27:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Gestion.update_working_time(working_time, update_attrs)
      assert working_time.start == ~U[2023-10-24 14:27:00Z]
      assert working_time.end == ~U[2023-10-24 14:27:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Gestion.update_working_time(working_time, @invalid_attrs)
      assert working_time == Gestion.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Gestion.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Gestion.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Gestion.change_working_time(working_time)
    end
  end
end
