class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	private 
	def current_user
		@current_user ||=User.find(session[:userid]) if session[:userid]
	end
	helper_method :current_user
	def authorize 
		redirect_to new_session_path, alert: 'Log in or Sign up' if current_user.nil?
	end
end
