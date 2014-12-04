class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters,
            if: :devise_controller?

  rescue_from 'Pundit::NotAuthorizedError' do |exception|
    flash[:error] = "No, no, no"
    redirect_to root_path
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :email
  end
end
