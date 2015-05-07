class TodosController < ApplicationController
  def create
    List.find(params["todo"]["parent_id"]).todos.create(todos_params)
    redirect_to list_path(params["todo"]["parent_id"])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    binding.pry
    puts params
    photo = Photo.create(todos_params.extract!("avatar"))
    todo = Todo.find(params[:todo][:id])
    todo.update(todos_update)
    todo.photo = photo
    respond_to do |format|
      format.html { redirect_to lists_path }
      format.js
    end
  end

  private

  def todos_params
    params.require(:todo).permit(:title, :desc, :due_date, :active, :avatar)
  end

  def todos_update
    params.require(:todo).permit(:title, :desc, :due_date, :active)
  end
end
