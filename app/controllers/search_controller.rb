class SearchController < ActionController::Base
  
  def index
    respond_to do |format|
      format.html { render :layout=> "application" }# index.html.erb
    end
  end

  def search_by_fields
  	tag = params[:tag]
  	post_date = params[:post_date]
  	keyword = params[:keyword]

  	#post by tags
    if(tag != "")
      @posts = Post.joins(:tags).where(:tags=>{:label=> tag} ).uniq
    end
    
    #post by date posted
    if(post_date != "")    
      @posts = Post.find(:all, :conditions=>['created_at LIKE ?', post_date+'%']).uniq
    end
    
    #post by keyword
    if(keyword != "")
      @posts = Post.find(:all, :conditions=>['content LIKE ?', keyword+'%']).uniq
    end

    @count = @posts.count;

    respond_to do |format|
      format.js
    end

  end
end
