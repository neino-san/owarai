class PostsController < ApplicationController
  # 各アクションが呼び出される前に、set_target_postを実行する
  before_action :set_target_post, only: %i[show edit update destroy]

  def index
    @posts = Post.includes(:user).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = '投稿されました'
      redirect_to posts_path
    else
      redirect_to new_post_path, flash: { error_messages: @post.errors.full_messages }
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @comment = Comment.new
    @comments = @post.comments.includes(post: :comments)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = '投稿を更新しました!'
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '投稿を削除しました'
    redirect_to posts_path
  end

  private
  # paramsからname,title,content,image,remove_image,kind,idのみ抽出
  def post_params
    params.require(:post).permit(:name, :title, :content, :image, :remove_image, :kind, :id)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end
end
