class VerificationController < ApplicationController

  def new
    user = User.find_by_id(params[:id])
    if user.present?
      @user = user
    else
      flash[:alert] = "Invalid link"
      redirect_to '/sign_in'
   end
  end

  def create
    @user = User.find(params[:id])
    if @user.code == params[:code]
      @user.update_attribute('code',"")
      session[:user_id] = nil
      respond_to do |format|
        format.html { redirect_to sign_in_path, notice: "User verified successfully." }
        format.json { render :show, status: :created, location: @user }
      end
   else
      flash[:alert] = "Invalid Code"
      redirect_to "/verify/#{params[:id]}"
   end
  end
    
end
