class Api::TodosController < ApplicationController

  def update
    Todo.find(params[:id]).update(active: params[:active])
    render nothing: true
  end

  def create
    puts params["body"]
    render :nothing => true, :status => 200
  end
end
