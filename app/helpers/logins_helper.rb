module LoginsHelper
  def sign_in(lecturer)
   session[:lecturer_id] = lecturer.id
  end

  def current_lecturer
    @current_lecturer ||= Lecturer.find_by(id: session[:lecturer_id])
  end


  def signed_in?
    !current_lecturer.nil?
  end

  def signout
    session.delete(:lecturer_id)
    @current_lecturer = nil
  end

end
