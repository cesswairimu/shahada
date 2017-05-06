class LecturersController < ApplicationController

  def new
    @lecturer = Lecturer.new
  end
  def create
    @lecturer = Lecturer.new(lec_params)
    if @lecturer.save
      sign_in @lecturer
      flash[:success] = "Welcome to Shahada!!!"
      redirect_to @lecturer
    else
      flash.now[:nasty]="OOPSSS !!Check your inputs and try again"
      render 'new'
    end
  end

  def show
    @lecturer = Lecturer.find(params[:id])
    # debugger
  @assignments = @lecturer.assignments
  end

  def edit
    @lecturer = Lecturer.find(params[:id])
  end

  def update
    @lecturer = Lecturer.find(params[:id])
    if  @lecturer.update_attributes(lec_params)
      flash[:success] = 'Profile updated!!'
      redirect_to @lecturer
    else
      flash.now[:nasty] = 'Please check your information'
      render 'edit'
    end
  end
  private
  def lec_params
    params.require(:lecturer).permit(:f_name,:l_name,:id_no, :school, :phone, :email, :password, :password_confirmation)
  end
end
