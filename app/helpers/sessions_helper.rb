module SessionsHelper

  #Logs in a given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #Returns the currently logged in user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
      user = User.find_by(id: user_id)
    elsif user && user.authenticated?
      log_in user
      @current_user = user
    end
  end

# def lecturer_user
#   @lecturer_user ||= Lecturer.find_by(id:session[:user_id])
# end

#Returns true if current_user is not nil
def logged_in?
  !current_user.nil?
end

def logout
  session.delete(:user_id)
  @current_user = nil
end

end
