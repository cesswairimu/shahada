class LoginsController < ApplicationController
  def new
  end

  def create
    lecturer = Lecturer.find_by(email: params[:login][:email])
    if lecturer && lecturer.authenticate(params[:login][:password])
      flash[:success] = "Welcome back "
      sign_in lecturer
      redirect_to lecturer
    else
      flash.now[:nasty] = "Invalid credentials  for login"
      render 'new'
    end
  end

  def destroy
    signout
    redirect_to root_url
  end


end
