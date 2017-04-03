class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])||
    lecturer = Lecturer.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])||
     lecturer && lecturer.authenticate(params[:session][:password])
      flash[:success] = "Welcome back "
      login user ||  lecturer
      redirect_to user ||  lecturer
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
