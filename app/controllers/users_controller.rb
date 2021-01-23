class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def following
    @title = "フォロー"
    @user  = User.friendly.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
 
  def followers
    @title = "フォロワー"
    @user  = User.friendly.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :id)
  end
  
  private

  def set_user
    @user = User.find([:id])
  end
  
end
