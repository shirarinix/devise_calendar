class ApplicationController < ActionController::Base
  before_action :configuer_permitted_parameters, if: :devise_controller?

  private

  def configuer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_image, :sex, :birthday])
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:artistname, :artist_image, :twitter, :facebook, :instagram, :sex, :birthday,
                                             :discography])
  end
end
