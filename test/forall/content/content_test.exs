defmodule Forall.ContentTest do
  use Forall.DataCase

  alias Forall.Content

  describe "comments" do
    alias Forall.Content.Comment

    @valid_attrs %{comment: "some comment", email: "some email", name: "some name"}
    @update_attrs %{comment: "some updated comment", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{comment: nil, email: nil, name: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Content.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Content.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Content.create_comment(@valid_attrs)
      assert comment.comment == "some comment"
      assert comment.email == "some email"
      assert comment.name == "some name"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, comment} = Content.update_comment(comment, @update_attrs)
      assert %Comment{} = comment
      assert comment.comment == "some updated comment"
      assert comment.email == "some updated email"
      assert comment.name == "some updated name"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_comment(comment, @invalid_attrs)
      assert comment == Content.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Content.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Content.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Content.change_comment(comment)
    end
  end
end
