class AssignmentsController < ApplicationController
  before_action :logged_in_lecturer, only:[:create, :edit, :show, :update, :destroy]
  def new
    @assignment = current_lecturer.assignments.build
  end
  def create
    @assignment = current_lecturer.assignments.build(assign_params)
    if @assignment.save
      flash[:success] = "Your assignment is posted"
      redirect_to current_lecturer
    else
      flash[:nasty] = "Please check the assignment's errors"
      render 'new'
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if
      @assignment.update_attributes(assign_params)
      flash[:success] = "Assignment successfully updated!!"
      redirect_to @assignment
    else
      flash[:nasty]= "Error updating assignment"
      render 'edit'
    end
  end

  def index
    @assignments = Assignment.all
    # @assignment = Assignment.find(params[:id])
    # @my_assignments = Assignment.where("lecturer_id = @assignment.lecturer_id")
  end

  def show
    @assignment = current_lecturer.assignments.find(params[:id])
  end

  private

  def assign_params
    params.require(:assignment).permit( :title, :unit_code, :attachment, :due_date)
  end
end
