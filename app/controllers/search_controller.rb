class SearchController < ActionController::Base
  
  def index
    respond_to do |format|
      format.html { render :layout=> "application" }# index.html.erb
    end
  end

  def search_by_fields
    @posts = Post.by_tag(params[:tag]).by_keyword(params[:keyword]).by_created(params[:post_date]);
    @count = @posts.count;

    respond_to do |format|
      format.js
    end

  end
end
