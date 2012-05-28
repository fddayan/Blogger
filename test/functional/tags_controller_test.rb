require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "create tag" do
    @tag = Tag.create :label=>"tagTest" 
    assert_response :success
  end

  test "createController tag" do
    post :create,:label=>"tagTest2" 
    assert_response 302
  end

  test "get tag" do
    @user = User.create :mail=>"federico.dayan@globant.com",:password=>"pass123", :name=>"fede",:lastname=>"dayan"
    #se setea la session con el id del usuario creado
    session[:user_id] = @user.id
    @tag = Tag.create :label=>"tagTest" 
    get :show, :id =>@tag.id
    assert_response :success
  end

  # setup do
  #   @tag = tags(:one)
  # end
  # 
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:tags)
  # end
  # 
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  # 
  # test "should create tag" do
  #   assert_difference('Tag.count') do
  #     post :create, tag: { label: @tag.label }
  #   end
  # 
  #   assert_redirected_to tag_path(assigns(:tag))
  # end
  # 
  # test "should show tag" do
  #   get :show, id: @tag
  #   assert_response :success
  # end
  # 
  # test "should get edit" do
  #   get :edit, id: @tag
  #   assert_response :success
  # end
  # 
  # test "should update tag" do
  #   put :update, id: @tag, tag: { label: @tag.label }
  #   assert_redirected_to tag_path(assigns(:tag))
  # end
  # 
  # test "should destroy tag" do
  #   assert_difference('Tag.count', -1) do
  #     delete :destroy, id: @tag
  #   end
  # 
  #   assert_redirected_to tags_path
  # end
end
