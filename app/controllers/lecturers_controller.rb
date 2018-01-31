class LecturersController < ApplicationController

  def new
    @lecturer = Lecturer.new
  end
  def create
    @lecturer = Lecturer.new(lec_params)
    if @lecturer.save
      HolderMailer.account_activation(@lecturer).deliver_now
      flash[:info] = "Check mail to activate account"
      redirect_to root_url
    else
      flash.now[:nasty]="OOPS!! Check your input and try again"
      render 'new'
    end
  end

  def show
    @lecturer = Lecturer.find(lec_id)
  @assignments = @lecturer.assignments
  end

  def edit
    @lecturer = Lecturer.find(lec_id)
  end

  def index
    @lecturers = Lecturer.all
  end

  def update
    @lecturer = Lecturer.find(lec_id)
    if  @lecturer.update_attributes(lec_params)
      flash[:success] = 'Profile updated!!'
      redirect_to @lecturer
    else
      flash.now[:nasty] = 'Please check your information'
      render 'edit'
    end
  end

  def destroy
    Lecturer.find(lec_id).destroy
    flash[:success] = "Lecturer Deleted"
    redirect_to lecturers_path
  end

  private
  def lec_params
    params.require(:lecturer).permit(:f_name,:l_name,:id_no, :school, :phone, :email, :password, :password_confirmation)
  end

  def lec_id
    params[:id]
  end

end
