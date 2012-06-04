class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user! 
  load_and_authorize_resource
  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @user= User.find(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @user= User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @user= User.find(params[:user_id])
    @post = Post.find(params[:id])
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = (params[:user_id])
    @user = User.find(params[:user_id])
    tags = params[:tag].split(', ')
    tags.each do |t|
      t.strip!
      tag = Tag.where(:label => t).first
      if (tag == nil)
        tag = Tag.new(:label => t)
        tag.save
      end
      @post.tags << tag
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @user, notice: 'Post was successfully created.' }
        format.json { render json: @user, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @user= User.find(params[:user_id])
    @post.user_id = (params[:user_id])
    tags = params[:tag].split(', ')
    @post.tags.clear
    tags.each do |t|
      tag = Tag.where(:label => t).first
      if (tag == nil)
        tag = Tag.new(:label => t)
        tag.save
      end
      @post.tags << tag
    end
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to [@user,@post], notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE users/{id}/posts/1
  # DELETE users/{id}/posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @user= User.find(params[:user_id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_url @user }
      format.json { head :no_content }
    end
  end
end
    