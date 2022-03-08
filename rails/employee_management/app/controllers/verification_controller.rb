class VerificationController < ApplicationController

  def new
   session[:user_id]=User.find(params[:id]).id
  end

  def create
      code=params[:code]
       debugger
       @user=User.find(session[:user_id])
       user_code=User.find(session[:user_id]).code
    if user_code==code
       @user.code=""
       @user.save
       session[:user_id]=nil
        respond_to do |format|
          format.html { redirect_to sign_in_path, notice: "User verified successfully." }
          format.json { render :show, status: :created, location: @user }
        end
    else
    flash.alert = "Invalid Code"
    end
  end
    
end
