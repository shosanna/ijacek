class PhotosController < ApplicationController
  def create
    photo = Photo.new(params[:photo])
    unless photo.save
      flash.notice = "Photo was not saved"
    end
    redirect_to photo.activity
  end

  def destroy
    Photo.find(params[:id]).destroy
    flash.notice = "Photo deleted!"
    redirect_to activities_path
  end

end