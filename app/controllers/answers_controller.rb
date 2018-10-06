class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(ans_params)
    # binding.pry
    if @answer.save
      flash[:info] = "Answer posted"
      redirect_to questions_path
    else
      flash.now[:nasty]="OOPS!! Check your input and try again"
    end
  end

private
  def ans_params
    params.require(:answer).permit(:body, :question_id, :user_id, :user_type)
  end
end
