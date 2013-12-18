class UserMailer < ActionMailer::Base
  default from: "service@justcalltony.com"

  def account_confirmed(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Welcome to Just Call Tony')
  end
end
