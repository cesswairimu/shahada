class UserMailer < ApplicationMailer
  def activate(user)
    @user = user
    mail(:to  => "#{user.f_name} <#{user.email}>", :subject => "Account Activation")
  end
end
