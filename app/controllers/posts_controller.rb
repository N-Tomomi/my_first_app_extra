class PostsController < ApplicationController

  def index
    # includesメソッドはN+1問題を解消することができる。
    # 指定された関連モデルをまとめて一緒に取得しておくことで、SQLの発行回数を減らすことができる。
    @posts = Post.includes(:user)
  end

  def new 
    @post = Post.new
  end

  def create
    # current_userメソッドはdeviseのヘルパーメソッド
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  # レコードを指定、指定されたレコードを削除、トップページへリダイレクトするよう設定。
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

end

