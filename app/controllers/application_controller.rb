class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configuer_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む記述に変更
    end
  end

  protected

  def configuer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_image, :sex, :hobby, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :user_image, :sex, :hobby, :birthday])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:artistname, :artist_image, :sex, :hobby, :birthday,
                                                       :discography, :twitter, :facebook, :instagram])
  end
end
