class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private

  # ログインしているユーザーを取得する
  def current_user
    # session[:user_id]がnilの場合は、nilを返す
    # find_byは、データが見つからなかった場合にnilを返す
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # ログインしていない場合は、ログイン画面にリダイレクトする
  def login_required
    redirect_to login_path unless current_user
  end
end
