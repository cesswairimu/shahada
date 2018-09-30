class SessionsController < ApplicationController
  def new
  end
  def create
    student = Student.find_by(email: params[:session][:email])
    if student && student.authenticate(params[:session][:password])
      flash[:success] = "Welcome back "
      log_in student 
      redirect_to student 
    else
      flash.now[:nasty] = "Invalid credentials  for login"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end
