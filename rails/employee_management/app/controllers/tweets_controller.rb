class TweetsController < ApplicationController
  

  # GET /tweets or /tweets.json
  def index
    if session[:user_id].nil?
      redirect_to '/sign_in'
    else
      @user = User.find(session[:user_id])
      @tweets = Tweet.all
    end
    
  end

  def show
  end



end
