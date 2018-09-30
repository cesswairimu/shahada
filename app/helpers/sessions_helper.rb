module SessionsHelper

  #Logs in a given student
  def log_in(student)
    session[:student_id] = student.id
  end

  #Returns the currently logged in student
  def current_student
    if (student_id = session[:student_id])
      @current_student ||= Student.find_by(id: student_id)
      student = Student.find_by(id: student_id)
    elsif student && student.authenticated?
      log_in student
      @current_student = student
    end
  end

# def lecturer_student
#   @lecturer_student ||= Lecturer.find_by(id:session[:student_id])
# end

#Returns true if current_student is not nil
def logged_in?
  !current_student.nil?
end

def logout
  session.delete(:student_id)
  @current_student = nil
end

end
