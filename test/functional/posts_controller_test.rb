require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  test " create post" do
    @user = User.create :mail=>"federico.dayan@globant.com",:password=>"pass123", :name=>"fede",:lastname=>"dayan" 
    post :create,:user_id=>@user.id,:title=>"Titulo",:content=>"Contenido",:tag=>"tag12, tag22"
    assert_response 302
    assert_redirected_to "/users/#{@user.id}"
  end

  test "delete post" do
    @user = User.create :mail=>"federico.dayan@globant.com",:password=>"pass123", :name=>"fede",:lastname=>"dayan" 
    @tag = Tag.create :label=>"tag1"
    @post = Post.create :content=>"Contenido",:title=>"Titulo",:user_id=>@user.id
    #puts ">>>>>>>>>>>>>>>>Post>>>>>>>>>>>>>>>",@post.id
    #puts ">>>>>>>>>>>>>>>>Tag>>>>>>>>>>>>>>>",@tag.id
    #puts ">>>>>>>>>>>>>>>>User>>>>>>>>>>>>>>",@user.id
    delete :destroy, :user_id=>@user.id, :id =>@post.id
    assert_response 302
    assert_redirected_to "/users/#{@post.user_id}/posts"
  end
  # setup do
  #   @post = posts(:one)
  # end
  # 
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:posts)
  # end
  # 
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  # 
  # test "should create post" do
  #   assert_difference('Post.count') do
  #     post :create, post: { content: @post.content, user_id: @post.user_id }
  #   end
  # 
  #   assert_redirected_to post_path(assigns(:post))
  # end
  # 
  # test "should show post" do
  #   get :show, id: @post
  #   assert_response :success
  # end
  # 
  # test "should get edit" do
  #   get :edit, id: @post
  #   assert_response :success
  # end
  # 
  # test "should update post" do
  #   put :update, id: @post, post: { content: @post.content, user_id: @post.user_id }
  #   assert_redirected_to post_path(assigns(:post))
  # end
  # 
  # test "should destroy post" do
  #   assert_difference('Post.count', -1) do
  #     delete :destroy, id: @post
  #   end
  # 
  #   assert_redirected_to posts_path
  # end
end
