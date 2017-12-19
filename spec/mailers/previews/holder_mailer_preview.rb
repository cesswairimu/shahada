# Preview all emails at http://localhost:3000/rails/mailers/holder_mailer
class HolderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/holder_mailer/account_activation
  def account_activation
    HolderMailerMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/holder_mailer/password_reset
  def password_reset
    HolderMailerMailer.password_reset
  end

end
