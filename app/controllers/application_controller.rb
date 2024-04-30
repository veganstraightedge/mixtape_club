class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def set_current_user
    Current.user ||= current_user
  end
end
