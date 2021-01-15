class MicropostController < ApplicationController

  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
      
  end
  
  def create
    @post = Post.find_by(id: params[:id])
    @post.save
    redirect_to("/posts/index")
  end
  
  def destroy
  end
end