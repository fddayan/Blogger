class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?
  # TO_DELETE push test over http --fer--
  	def after_sign_in_path_for(user)
    	user_path user
  	end
end
