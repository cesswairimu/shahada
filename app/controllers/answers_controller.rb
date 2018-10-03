class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create 
    @answer = Answer.create(ans_params)
  end

private
  def ans_params
    params.require(:answer).permit(:body)
  end
end
