class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])||
    if user && user.authenticate(params[:session][:password])||
      flash[:success] = "Welcome back "
      log_in user 
      redirect_to user 
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
