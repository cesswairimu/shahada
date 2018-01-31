class AccountActivationsController < ApplicationController
  def edit
    holder = User.find_by(email: params[:email]) || Lecturer.find_by(email: params[:id])
    if holder && !holder.activated? && holder.authenticated?(:activation, params[:id])
      holder.update_attribute(:activated, true)
      holder.update_attribute(:activated_at, Time.zone.now)
      log_in holder || sign_in holder
      flash[:success] = "Account activated!"
      redirect_to holder
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
