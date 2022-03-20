class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_family])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_first])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_kana_family])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_kana_first])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:post_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
  end
end
