defmodule Poc.ProfileTest do
  use Poc.DataCase

  alias Poc.Profile

  describe "users" do
    alias Poc.Profile.User

    @valid_attrs %{last_name: "some last_name", name: "some name"}
    @update_attrs %{last_name: "some updated last_name", name: "some updated name"}
    @invalid_attrs %{last_name: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Profile.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Profile.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Profile.create_user(@valid_attrs)
      assert user.last_name == "some last_name"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Profile.update_user(user, @update_attrs)
      assert user.last_name == "some updated last_name"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_user(user, @invalid_attrs)
      assert user == Profile.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Profile.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Profile.change_user(user)
    end
  end

  describe "users" do
    alias Poc.Profile.User

    @valid_attrs %{email: "some email", last_name: "some last_name", name: "some name", phone: "some phone"}
    @update_attrs %{email: "some updated email", last_name: "some updated last_name", name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{email: nil, last_name: nil, name: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Profile.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Profile.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Profile.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.last_name == "some last_name"
      assert user.name == "some name"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Profile.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.last_name == "some updated last_name"
      assert user.name == "some updated name"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_user(user, @invalid_attrs)
      assert user == Profile.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Profile.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Profile.change_user(user)
    end
  end
end
