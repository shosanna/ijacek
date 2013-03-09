class PhotosController < ApplicationController
  def create
    photo = Photo.new(params[:photo])
    photo.save!
    redirect_to photo.activity
  end

end