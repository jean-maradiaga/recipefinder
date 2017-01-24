class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    attachments.inline['logo.png'] =  File.read(Rails.root.join('app', 'assets', 'images', 'site-logo2.png'))
    attachments.inline['hero.png'] =  File.read(Rails.root.join('app', 'assets', 'images', 'hero.png'))
    mail to: user.email, subject: "Account activation"

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
