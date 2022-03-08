class UserMailer < ApplicationMailer
  default from: 'surajdubey2791@gmail.com'

  def welcome_email()
    @user = params[:user]
    id=@user.id
    @url = "https://localhost:3000/verify/#{@user.id}"
    mail(to: @user.email, subject: 'Welcome to Tweets')
  end
end
