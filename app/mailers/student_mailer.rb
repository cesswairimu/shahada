class StudentMailer < ApplicationMailer
  def activate(student)
    @student = student
    mail(:to  => "#{student.f_name} <#{student.email}>", :subject => "Account Activation")
  end
end
