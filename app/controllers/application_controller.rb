class ApplicationController < ActionController::Base
  	protect_from_forgery
    #check_authorization
  	check_authorization :unless => :devise_controller?
    
  	rescue_from CanCan::AccessDenied do |exception|
    	render :file => "#{Rails.root}/public/403"
  	end
	# TO_DELETE push test over http --fer--
 
  	def after_sign_in_path_for(user)
    	user_path user
  	end
end
