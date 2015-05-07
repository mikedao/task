class ListsController < ApplicationController

  def index
    @active = List.active
  end

  def hidden
    @inactive = List.inactive
  end

  def new
    @list = List.new
  end

  def create
    List.create(list_params)
    redirect_to lists_path
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path
  end

  def show
    @todo = Todo.new
    @todos = List.find(params[:id]).todos.where(active: true)
  end

  def inactive_todos
    @todo = Todo.new
    @todos = List.find(params[:id]).todos.where(active: false)
  end


  private

  def list_params
    params.require(:list).permit(:title, :active)
  end
end
