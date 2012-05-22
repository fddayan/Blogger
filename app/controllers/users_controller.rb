class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @post = Post.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])  
    image =  params[:user][:image]
    
    # save image
    directory = ""
    path = File.join(directory, image.original_filename)
    File.open(path, "wb") { |f| f.write(image.read) }

    @user.image = '/assets'+path
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def show_login
    respond_to do |format|
      if(session[:user_id])  
        @user = User.find_by_id(session[:user_id])
        format.html { redirect_to @user, notice: "Already logued." }         
      else
        format.html # index.html.erb
      end
    end
  end

  def authenticate
    @user = User.find_by_mail_and_password(params[:mail], params[:password])    
    respond_to do |format|
      if (@user)
        session[:user_id] = @user.id
        User.find(session[:user_id])
        format.html { redirect_to @user, notice: "User was successfully logued." }        
      else        
        format.html do 
          flash[:notice] = "Fail to login #{params[:mail]}"
          redirect_to(:controller => "login", :action => "index") 
        end
      end
    end
  end

  def logout  
    respond_to do |format|
      reset_session
      format.html {redirect_to(:controller => "users", :action => "show_login") }
    end
  end
end