class AnswersController < ApplicationController
  def create

    # Jestlize ma current user odpoved k dane otazce,
    # najdu odpoved a dam update attributes na text.
    # 1) musim zjistit jestli existuje answer, co ma person_id a
    #  question_id co miri ke stejny veci, co jsou propojeny
    # 2) Vythahnu answers od daneho cloveka a podivam se

    answer = current_user.answers.where(:question_id => params[:answer][:question_id]).first

    if answer
      answer.update_attributes(params[:answer])
      flash.notice = "Answer changed!"
      redirect_to current_user
    else
      @answer = Answer.new(params[:answer])
      @answer.person = current_user
      @answer.save!
      flash.notice = "Answer created!"
      redirect_to current_user
    end
  end

  def index
  end

  def destroy
  end

end
