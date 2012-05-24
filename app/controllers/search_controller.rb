class SearchController < ActionController::Base
  
  def index
    respond_to do |format|
        format.html { render :layout=> "not_logged" }# index.html.erb
    end
  end

  def search_by_fields
  	tag = params[:tag]
  	post_date = params[:post_date]
  	keyword = params[:keyword]

  	#post by tags
    @posts = Post.joins(:tags).where(:tags=>{:label=> tag} ).uniq
    #post by date posted
    #@posts = Post.where(:created_at=> post_date).uniq
    #post by keyword
    #@posts = Post.find(:condition=> [content LIKE ?', keyword+'%']).uniq
    #@msg1 = "prueba"
    respond_to do |format|
      format.js
    end

  end
end
