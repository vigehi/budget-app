class ApplicationController < ActionController::Base
  before_action :update_devise_permitted_parameters, if: :devise_controller?

  protected

  def update_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
