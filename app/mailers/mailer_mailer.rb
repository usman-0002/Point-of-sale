# frozen_string_literal: true

# Mailer class for Devise Mail Configration
class MailerMailer < ApplicationMailer
  default from: 'from@example.com'

  def reset_password_instructions(user)
    @user = user
    mail(to: @user.email, subject: 'reset_password_instructions')
  end
end
