class TodosController < ApplicationController
  def create
    List.find(params["todo"]["parent_id"]).todos.create(todos_params)
    redirect_to list_path(params["todo"]["parent_id"])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    todo = Todo.find(params[:id]).update(todos_params)
    redirect_to lists_path
  end

  private

  def todos_params
    params.require(:todo).permit(:title, :desc, :due_date, :active)
  end
end
