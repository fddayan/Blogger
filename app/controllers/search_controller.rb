class SearchController < ActionController::Base
  
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def search_by_fields
  	tag = params[:tag]
  	post_date = params[:post_date]
  	keyword = params[:keyword]

  	#@posts = Post.joins(:tags).where(:tags=>{:label=> tag} ).uniq
  	@msg1 = "Buenos Dias!" 	
    respond_to do |format|
      format.js
    end
  end

end
