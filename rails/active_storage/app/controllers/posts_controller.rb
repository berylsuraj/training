class PostsController < ApplicationController
  def index
    
    @posts = Post.all
  end
  def new
    @post = Post.new
  end


  def create

    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/posts/index', notice: "POst was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  
  end

  private 

  def post_params
    debugger
    params.permit(:title, :profile_image)
  end
end
