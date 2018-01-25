class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      HolderMailer.account_activation(@user).deliver_now
      flash[:info] = "Check mail to activate account"
      redirect_to root_url
    else
      flash.now[:nasty]="OOPSSS !!Check your inputs and try again"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successful profile edit"
      redirect_to @user
    else
      flash[:nasty]="Check your inputs and try again"
      render 'edit'
      
    end
    
  end

  private
  def user_params
    params.require(:user).permit( :reg_no, :f_name, :l_name, :email,
                                 :phone, :school, :password, :password_confirmation )
  end
end
