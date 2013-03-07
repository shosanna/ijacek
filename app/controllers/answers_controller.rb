class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer])
    @answer.person = current_user
    @answer.save!
    flash.notice = "Answer created!"
    redirect_to current_user
  end

  def index
  end

  def destroy
  end

end
