class PhotosController < ApplicationController

  def create
    photo = Photo.create!(params[:photo])
    redirect_to photo.activity
  end

end