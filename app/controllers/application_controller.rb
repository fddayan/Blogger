class ApplicationController < ActionController::Base
  	before_filter :set_locale

    def set_locale      
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
      { :locale => I18n.locale }
    end

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
