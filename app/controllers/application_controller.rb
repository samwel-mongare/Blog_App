class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning

  # Used when not using api calls
  # protect_from_forgery with: :exception

  protect_from_forgery prepend: true

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :email, :password, :current_password)
    end
  end
end
