class PostsController < ApplicationController

  def index
    # includesメソッドはN+1問題を解消することができる。
    # 指定された関連モデルをまとめて一緒に取得しておくことで、SQLの発行回数を減らすことができる。
    # @posts = Post.includes(:user)
    # orderメソッド テーブルから取得してきた複数のレコード情報を持つインスタンスの並び順を変更 order("並び替えの基準となるカラム名 並び順")
    # @posts = Post.includes(:user).order("created_at DESC")
    # kaminari を用いて使えるようになったメソッドを利用.page(params[:page]).per(1ページで表示したい件数)
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(4)
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

