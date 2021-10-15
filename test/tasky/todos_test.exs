defmodule Tasky.TodosTest do
  use Tasky.DataCase

  alias Tasky.Todos

  describe "categories" do
    alias Tasky.Todos.Category

    import Tasky.TodosFixtures

    @invalid_attrs %{title: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Todos.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Todos.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Category{} = category} = Todos.create_category(valid_attrs)
      assert category.title == "some title"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Category{} = category} = Todos.update_category(category, update_attrs)
      assert category.title == "some updated title"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_category(category, @invalid_attrs)
      assert category == Todos.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Todos.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Todos.change_category(category)
    end
  end

  describe "todos" do
    alias Tasky.Todos.Todo

    import Tasky.TodosFixtures

    @invalid_attrs %{description: nil, done: nil, title: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Todos.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Todos.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{description: "some description", done: true, title: "some title"}

      assert {:ok, %Todo{} = todo} = Todos.create_todo(valid_attrs)
      assert todo.description == "some description"
      assert todo.done == true
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{description: "some updated description", done: false, title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Todos.update_todo(todo, update_attrs)
      assert todo.description == "some updated description"
      assert todo.done == false
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo(todo, @invalid_attrs)
      assert todo == Todos.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Todos.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Todos.change_todo(todo)
    end
  end

  describe "checklists" do
    alias Tasky.Todos.Checklist

    import Tasky.TodosFixtures

    @invalid_attrs %{name: nil}

    test "list_checklists/0 returns all checklists" do
      checklist = checklist_fixture()
      assert Todos.list_checklists() == [checklist]
    end

    test "get_checklist!/1 returns the checklist with given id" do
      checklist = checklist_fixture()
      assert Todos.get_checklist!(checklist.id) == checklist
    end

    test "create_checklist/1 with valid data creates a checklist" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Checklist{} = checklist} = Todos.create_checklist(valid_attrs)
      assert checklist.name == "some name"
    end

    test "create_checklist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_checklist(@invalid_attrs)
    end

    test "update_checklist/2 with valid data updates the checklist" do
      checklist = checklist_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Checklist{} = checklist} = Todos.update_checklist(checklist, update_attrs)
      assert checklist.name == "some updated name"
    end

    test "update_checklist/2 with invalid data returns error changeset" do
      checklist = checklist_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_checklist(checklist, @invalid_attrs)
      assert checklist == Todos.get_checklist!(checklist.id)
    end

    test "delete_checklist/1 deletes the checklist" do
      checklist = checklist_fixture()
      assert {:ok, %Checklist{}} = Todos.delete_checklist(checklist)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_checklist!(checklist.id) end
    end

    test "change_checklist/1 returns a checklist changeset" do
      checklist = checklist_fixture()
      assert %Ecto.Changeset{} = Todos.change_checklist(checklist)
    end
  end

  describe "notebooks" do
    alias Tasky.Todos.Notebook

    import Tasky.TodosFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_notebooks/0 returns all notebooks" do
      notebook = notebook_fixture()
      assert Todos.list_notebooks() == [notebook]
    end

    test "get_notebook!/1 returns the notebook with given id" do
      notebook = notebook_fixture()
      assert Todos.get_notebook!(notebook.id) == notebook
    end

    test "create_notebook/1 with valid data creates a notebook" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Notebook{} = notebook} = Todos.create_notebook(valid_attrs)
      assert notebook.description == "some description"
      assert notebook.title == "some title"
    end

    test "create_notebook/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_notebook(@invalid_attrs)
    end

    test "update_notebook/2 with valid data updates the notebook" do
      notebook = notebook_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Notebook{} = notebook} = Todos.update_notebook(notebook, update_attrs)
      assert notebook.description == "some updated description"
      assert notebook.title == "some updated title"
    end

    test "update_notebook/2 with invalid data returns error changeset" do
      notebook = notebook_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_notebook(notebook, @invalid_attrs)
      assert notebook == Todos.get_notebook!(notebook.id)
    end

    test "delete_notebook/1 deletes the notebook" do
      notebook = notebook_fixture()
      assert {:ok, %Notebook{}} = Todos.delete_notebook(notebook)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_notebook!(notebook.id) end
    end

    test "change_notebook/1 returns a notebook changeset" do
      notebook = notebook_fixture()
      assert %Ecto.Changeset{} = Todos.change_notebook(notebook)
    end
  end
end
