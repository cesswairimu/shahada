class AssignmentsController < ApplicationController
  before_action :logged_in_lecturer, only:[:create, :edit, :update, :destroy]
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

private
def assign_params
  params.require(:assignment).permit( :title, :unit_code, :unit_name, :due_date)
end
end
