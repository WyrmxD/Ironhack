class ApplicationController < ActionController::Base
	include Pundit
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	rescue_from 'Pundit::NotAuthorizedError' do 
		flash[:error] = "Not authorized"
		redirect_to root_path
	end

	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :email
	end

end
