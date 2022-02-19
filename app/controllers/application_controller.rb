class ApplicationController < ActionController::Base
    before_action :authenticate # ログインしていない場合はトップページにリダイレクトするコールバック処理
    helper_method :logged_in?, :current_user

    private

    def logged_in? # !!session[:user_id]でも問題はないが、session[:user_id]に対応するUserが存在しない場合にログイン状態と判定しない方がより安全
        !!current_user
    end

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    def authenticate
        return if logged_in?
        redirect_to root_path, alert: "ログインしてください"
    end
end
