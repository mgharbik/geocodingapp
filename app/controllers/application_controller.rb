class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:street, :city, :zip])
    devise_parameter_sanitizer.permit(:account_update, keys: [:street, :city, :zip])
  end
end
