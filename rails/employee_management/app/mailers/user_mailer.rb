class UserMailer < ApplicationMailer
  default from: 'surajdubey2791@gmail.com'

  def welcome_email
    @user = params[:user]
    @url = 'localhost:3000/verify'
    mail(to: @user.email, subject: 'Welcome to Tweets. Please verify yourself by clicking above link')
  end
end
