class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :avatar])
  end
end
