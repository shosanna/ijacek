class QuestionsController < ApplicationController
  def create
    @question = Question.new(params[:question])
    @question.save!
    flash.notice = "Question created!"
    redirect_to new_question_path
  end

  def index
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash.notice = "Question deleted!"
    redirect_to root_path
  end
end
