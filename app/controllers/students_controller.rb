class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      StudentMailer.activate(@student).deliver
      flash[:info] = "Check mail to activate account"
      redirect_to root_url
    else
      flash.now[:nasty]="OOPSSS !!Check your input and try again"
      render 'new'
    end
  end

  def activate_account
    student = Student.find_by_activation_digest(params[:id])
    if student
      student.activate
      flash[:success] = "Account Activated! Login to continue to profile"
      redirect_to log_in_url
    else
      flash[:danger] = "Student does not exist"
      redirect_to root_url
    end
  end

  def show
    @student = Student.find(student_id)
  end

  def index
    @students = Student.all
  end

  def edit
    @student = Student.find(student_id)
  end

  def update
    @student = Student.find(student_id)
    if @student.update_attributes(student_params)
      flash[:success] = "Successful profile edit"
      redirect_to @student
    else
      flash[:nasty]="Check your input and try again"
      render 'edit'
    end
  end

  def destroy
     Student.find(student_id).destroy
    flash[:success] = "Student has been deleted"
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit( :reg_no, :f_name, :l_name, :email,
                                 :phone, :school, :password, :password_confirmation )
  end

  def student_id
    params[:id]
  end

end
