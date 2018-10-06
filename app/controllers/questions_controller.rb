class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    if logged_in?
    @question = current_student.questions.build(quiz_params)
    elsif signed_in?
    @question = current_lecturer.questions.build(quiz_params)
    @question
    end
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
    @answer = @question.answers.build
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(quiz_params)
      flash[:success] = "Your Answer was recorded"
      redirect_to @question
    else
      flash[:nasty] = "Error submitting your answer"
      render 'edit'
    end
  end

  def index
    @questions = Question.all
  end

  private
  def quiz_params
    params.require(:question).permit(:title, :body, :category, :answer, :tag)
  end
end
