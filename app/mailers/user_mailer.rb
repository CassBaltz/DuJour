class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_recovery.subject
  #
  def password_recovery(user)
    @user = user

    mail(
      to: user.email,
      subject: "meals | password recovery")
  end
end
