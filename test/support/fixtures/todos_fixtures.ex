defmodule Tasky.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tasky.Todos` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Tasky.Todos.create_category()

    category
  end

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        done: true,
        title: "some title"
      })
      |> Tasky.Todos.create_todo()

    todo
  end

  @doc """
  Generate a checklist.
  """
  def checklist_fixture(attrs \\ %{}) do
    {:ok, checklist} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Tasky.Todos.create_checklist()

    checklist
  end

  @doc """
  Generate a notebook.
  """
  def notebook_fixture(attrs \\ %{}) do
    {:ok, notebook} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Tasky.Todos.create_notebook()

    notebook
  end
end
