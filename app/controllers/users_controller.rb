class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10).order('updated_at DESC').includes(:user)
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :id)
  end
  
  private

  def set_user
    @user = User.find([:id])
  end
  
end
