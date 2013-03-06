class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer])
    @answer.person = current_user
    @answer.save!
    flash.notice = "Question created!"
    redirect_to root_path
  end

  def index
  end

  def destroy
  end

end
