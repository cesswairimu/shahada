class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome back #{user.f_name.capitalize}"
      login user
      redirect_to user
    else
      flash.now[:nasty] = "Invalid credentials  for login"
      render 'new'
    end
  end
end
