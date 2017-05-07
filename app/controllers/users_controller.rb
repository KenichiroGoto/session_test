class UsersController < ApplicationController

  def index
    login
    redirect_to blogs_path, notice: "セッションを開始します。"
  end

  def destroy
    user = User.find(session[:user_id])
    user.destroy
    reset_session
    redirect_to root_path, notice: "セッションを終了しました。"
  end

  def login
    if session[:user_id].blank?
      user = User.create
      session[:user_id] = user.id
    end
    # @user_id = session[:user_id]
  end

end
