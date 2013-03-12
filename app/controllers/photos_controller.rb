class PhotosController < ApplicationController

  def create
    photo = Photo.create!(params[:photo])
    redirect_to photo.activity
  end

  def destroy
    Photo.find(params[:id]).destroy
    flash.notice = "Photo deleted!"
    redirect_to activities_path
  end

end