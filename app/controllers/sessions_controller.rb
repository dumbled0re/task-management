class SessionsController < ApplicationController
  # ログインしていない状態でログイン画面を表示する必要があるため、skip_before_actionを追加
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "ログインしました。"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "ログアウトしました。"
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
