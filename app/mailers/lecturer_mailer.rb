class LecturerMailer < ApplicationMailer
  def activate(lecturer)
    @lecturer = lecturer
    mail(:to  => "#{lecturer.f_name} <#{lecturer.email}>", :subject => "Account Activation")
  end
end
