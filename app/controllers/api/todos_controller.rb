class Api::TodosController < ApplicationController

  def update
    Todo.find(params[:id]).update(active: params[:active])
  end
end
