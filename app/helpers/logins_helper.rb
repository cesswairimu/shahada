module LoginsHelper
  def sign_in(lecturer)
    session[:lecturer_id] = lecturer.id
  end

  def current_lecturer
    if (lecturer_id = session[:lecturer_id])
      @current_lecturer ||= Lecturer.find_by(id: lecturer_id)
      lecturer = Lecturer.find_by(id: lecturer_id)
    elsif lecturer && lecturer.authenticated?
      log_in lecturer
      @current_lecturer = lecturer
    end
  end


  def signed_in?
    !current_lecturer.nil?
  end

  def signout
    session.delete(:lecturer_id)
    @current_lecturer = nil
  end

end
