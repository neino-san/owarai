class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  # ログインしている
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  protected
# デバイスのストロングパラメーター
  def configure_permitted_parameters
    # 新規登録ではnameの保存を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # プロフィール変更では、name,profile,imageの保存を許可
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile image])
  end
end
