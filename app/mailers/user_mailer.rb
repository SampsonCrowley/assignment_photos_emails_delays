class UserMailer < ApplicationMailer
  default from: "your@mother.com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "You don' signed up")
  end
end
