class UserMailer < ApplicationMailer
  default from: "your@mother.com"

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "You don' signed up")
  end
end
