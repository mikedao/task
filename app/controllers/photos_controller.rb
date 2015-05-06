class PhotosController < ApplicationController
  def destroy
    Photo.find(params[:id]).destroy
    redirect_to lists_path
  end
end
