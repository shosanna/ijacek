class ImagesController < ApplicationController

  def update
    current_user.image = params[:image]
    current_user.save

    redirect_to person_path
  end

end