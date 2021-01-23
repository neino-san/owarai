class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]
    
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to posts_path
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end
  
  def edit
    @post = Post.find(params[:id])
  end  
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :title, :content)
  end
  
  def set_target_post
    @post = Post.find(params[:id])
  end
  
  def set_user
    @user = User.find([:id])
  end
end
