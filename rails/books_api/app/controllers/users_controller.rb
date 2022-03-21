class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def index
    @users = User.all
    render json: @user, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render  json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end


end
