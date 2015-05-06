class Api::TodosController < ApplicationController

  def update
    Todo.find(params[:id]).update(active: params[:active])
    render nothing: true
  end

  def create
    puts params[:body]
  end
end
