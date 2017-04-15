class AssignmentsController < ApplicationController
  before_action :logged_in_lecturer, only:[:create, :edit, :update, :destroy]
  def new
  end
def create
  @assignment = current_user.assignments.build(assign_params)
  if @assignment.save?
    flash[:success] = "Your assignment is posted"
    redirect_to @lecturer
  else
    flash[:nasty] = "Please check the assignment's errors"
    render 'new'
  end
end
end
