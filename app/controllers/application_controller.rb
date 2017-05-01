class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include LoginsHelper

  def logged_in_lecturer
    unless signed_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
