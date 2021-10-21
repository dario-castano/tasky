defmodule Tasky.Todos do
  @moduledoc """
  The Todos context.
  """

  import Ecto.Query, warn: false
  alias Tasky.Repo

  alias Tasky.Todos.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category) |> Repo.preload(:checklist)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Tasky.Todos.Todo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%Todo{}, ...]

  """
  def list_todos do
    Repo.all(Todo)
  end

  @doc """
  Gets a single todo.

  Raises `Ecto.NoResultsError` if the Todo does not exist.

  ## Examples

      iex> get_todo!(123)
      %Todo{}

      iex> get_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo!(id), do: Repo.get!(Todo, id)

  @doc """
  Creates a todo.

  ## Examples

      iex> create_todo(%{field: value})
      {:ok, %Todo{}}

      iex> create_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo.

  ## Examples

      iex> update_todo(todo, %{field: new_value})
      {:ok, %Todo{}}

      iex> update_todo(todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo.

  ## Examples

      iex> delete_todo(todo)
      {:ok, %Todo{}}

      iex> delete_todo(todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo(%Todo{} = todo) do
    Repo.delete(todo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo changes.

  ## Examples

      iex> change_todo(todo)
      %Ecto.Changeset{data: %Todo{}}

  """
  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end

  alias Tasky.Todos.Checklist

  @doc """
  Returns the list of checklists.

  ## Examples

      iex> list_checklists()
      [%Checklist{}, ...]

  """
  def list_checklists do
    Repo.all(Checklist) |> Repo.preload(:category)
  end

  @doc """
  Gets a single checklist.

  Raises `Ecto.NoResultsError` if the Checklist does not exist.

  ## Examples

      iex> get_checklist!(123)
      %Checklist{}

      iex> get_checklist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_checklist!(id), do: Repo.get!(Checklist, id) |> Repo.preload(:category)

  @doc """
  Creates a checklist.

  ## Examples

      iex> create_checklist(%{field: value})
      {:ok, %Checklist{}}

      iex> create_checklist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_checklist(attrs \\ %{}) do
    %Checklist{}
    |> Checklist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a checklist.

  ## Examples

      iex> update_checklist(checklist, %{field: new_value})
      {:ok, %Checklist{}}

      iex> update_checklist(checklist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_checklist(%Checklist{} = checklist, attrs) do
    checklist
    |> Checklist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a checklist.

  ## Examples

      iex> delete_checklist(checklist)
      {:ok, %Checklist{}}

      iex> delete_checklist(checklist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_checklist(%Checklist{} = checklist) do
    Repo.delete(checklist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking checklist changes.

  ## Examples

      iex> change_checklist(checklist)
      %Ecto.Changeset{data: %Checklist{}}

  """
  def change_checklist(%Checklist{} = checklist, attrs \\ %{}) do
    Checklist.changeset(checklist, attrs)
  end

  alias Tasky.Todos.Notebook

  @doc """
  Returns the list of notebooks.

  ## Examples

      iex> list_notebooks()
      [%Notebook{}, ...]

  """
  def list_notebooks do
    Repo.all(Notebook)
  end

  @doc """
  Gets a single notebook.

  Raises `Ecto.NoResultsError` if the Notebook does not exist.

  ## Examples

      iex> get_notebook!(123)
      %Notebook{}

      iex> get_notebook!(456)
      ** (Ecto.NoResultsError)

  """
  def get_notebook!(id), do: Repo.get!(Notebook, id)

  @doc """
  Creates a notebook.

  ## Examples

      iex> create_notebook(%{field: value})
      {:ok, %Notebook{}}

      iex> create_notebook(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_notebook(attrs \\ %{}) do
    %Notebook{}
    |> Notebook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a notebook.

  ## Examples

      iex> update_notebook(notebook, %{field: new_value})
      {:ok, %Notebook{}}

      iex> update_notebook(notebook, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_notebook(%Notebook{} = notebook, attrs) do
    notebook
    |> Notebook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a notebook.

  ## Examples

      iex> delete_notebook(notebook)
      {:ok, %Notebook{}}

      iex> delete_notebook(notebook)
      {:error, %Ecto.Changeset{}}

  """
  def delete_notebook(%Notebook{} = notebook) do
    Repo.delete(notebook)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking notebook changes.

  ## Examples

      iex> change_notebook(notebook)
      %Ecto.Changeset{data: %Notebook{}}

  """
  def change_notebook(%Notebook{} = notebook, attrs \\ %{}) do
    Notebook.changeset(notebook, attrs)
  end
end
