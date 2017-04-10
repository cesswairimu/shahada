class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(quiz_params)
    if @question.save
      flash[:success] = "You have posted your question"
      redirect_to @question
    else
      flash[:nasty] = "Check your inputs and try again"
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end
  def index
    @questions = Question.all
  end
  private
  def quiz_params
    params.require(:question).permit(:title, :body, :category, :answer, :tag)
  end
end
