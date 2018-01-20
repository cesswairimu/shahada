class HolderMailer < ApplicationMailer


    def account_activation(holder)
      @holder = holder
      mail to: holder.email, subject: "Account activation"
    end

    def password_reset
      @greeting = "Hello"
      mail to: "to@example.org"
    end

end
