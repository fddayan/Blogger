class ApplicationController < ActionController::Base
<<<<<<< HEAD
  	protect_from_forgery
    #check_authorization
  	check_authorization :unless => :devise_controller?
  	#rescue_from CanCan::AccessDenied do |exception|
    #	render :file => "#{Rails.root}/public/403"
  	#end
  	#resuce_from CanCan::AccessDenied do |exception|
  	#	render :file => "#{Rails.root}/public/403"
  	#end
	# TO_DELETE push test over http --fer--
=======
  protect_from_forgery
  check_authorization :unless => :devise_controller?
  # TO_DELETE push test over http --fer--
>>>>>>> c4cc5fe13fa15ac5479f8e98a30b0a391f5d4077
  	def after_sign_in_path_for(user)
    	user_path user
  	end
end
