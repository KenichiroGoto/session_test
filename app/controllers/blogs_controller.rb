class BlogsController < ApplicationController
  before_action :login_check
  before_action :set_blog, only: [:edit, :update, :destroy]

    def index
      @blogs = Blog.all
    end

    def new
      if params[:back]
        @blog = Blog.new(blogs_params)
      else
        @blog = Blog.new
      end
    end

    def create
      @blog = Blog.new(blogs_params)
      # validatesが成功し、保存できたらblog一覧表示画面へ遷移
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました！"
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      @blog.update(blogs_params)
      if @blog.save
        redirect_to blogs_path, notice: "ブログを更新しました！"
      else
        render "edit"
      end
    end

    def destroy
      @blog.destroy
      redirect_to blogs_path, notice: "ブログを削除しました！"
    end

    def confirm
      @blog = Blog.new(blogs_params)
      render :new if @blog.invalid?
    end

    def login_check
      if session[:user_id]
        @user = User.find(session[:user_id])
      else
        redirect_to root_path, notice: "ログインして下さい。"
      end
    end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
