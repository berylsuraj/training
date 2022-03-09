class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
  end

  # GET /users/new
  def new
    @user = User.new
  end


  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        SignupJob.perform_later @user
        format.html { redirect_to sign_in_path, notice: "Verification mail has been sent to you email." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
   params.permit(:name, :password, :password_confirmation, :email, :address, :gender, :terms )
  end
end
