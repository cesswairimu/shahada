module SessionsHelper

  #Logs in a given user
  def login(user)
    session[:user_id] = user.id
  end

  #Returns the currently logged in user
def current_user
  @current_user ||= User.find_by(id:session[:user_id])
end


#Returns true if current_user is not nil
def logged_in?
  !current_user.nil?
end

def logout
  session.delete(:user_id)
  @current_user = nil
end

end
