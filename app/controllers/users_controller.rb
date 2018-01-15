class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
      flash[:success] = "Congrats!! Your have successfully signed up!!!"
      flash[:success] = "Login to the application"
    else
      flash.now[:nasty]="OOPSSS !!Check your inputs and try again"
      render 'new'
    end
  end

  def show
    @user = User.find(user_id)
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(user_id)
  end

  def update
    @user = User.find(user_id)
    if @user.update_attributes(user_params)
      flash[:success] = "Successful profile edit"
      redirect_to @user
    else
      flash[:nasty]="Check your inputs and try again"
      render 'edit'
    end
  end

  def destroy
     User.find(user_id).destroy
    flash[:success] = "User has been deleted"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit( :reg_no, :f_name, :l_name, :email,
                                 :phone, :school, :password, :password_confirmation )
  end

  def user_id
    params[:id]
  end

end
