class SessionsController < ApplicationController
def new
    if session[:user_id].present?
      redirect_to '/tweets'
    end
  end

  def create

    user=User.find_by(email: params[:email])
    if user.present? && (user.password == params[:password])
      session[:user_id]=user.id
      redirect_to '/tweets', notice: "Logged In successfully"
    else
      flash.alert = "Invalid email or password"
      

    end
  end

  def destroy
    session[:user_id] = nil     
    redirect_to '/sign_in' 

  end
end
