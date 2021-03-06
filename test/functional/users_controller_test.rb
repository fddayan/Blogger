require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "authenticate with invalid user should redirect to login" do
    get :authenticate,:mail=>"federico.dayan@globant.com",:password=>"pass123" 
    
    assert_response 302
    assert_redirected_to "/"
  end
  
  test "authenticate with valid user should redirect show user action" do
     @user = User.create :mail=>"federico.dayan@globant.com",:password=>"pass123", :name=>"fede",:lastname=>"dayan" 
    
     get :authenticate,:mail=>"federico.dayan@globant.com",:password=>"pass123" 

     assert_response 302
     assert_redirected_to "/users/#{@user.id}"
   end
   
   
  # setup do
  #   @user = users(:one)
  # end
  # 
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:users)
  # end
  # 
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  # 
  # test "should create user" do
  #   assert_difference('User.count') do
  #     post :create, user: { birthdate: @user.birthdate, image: @user.image, lastname: @user.lastname, mail: @user.mail, name: @user.name, password: @user.password }
  #   end
  # 
  #   assert_redirected_to user_path(assigns(:user))
  # end
  # 
  # test "should show user" do
  #   get :show, id: @user
  #   assert_response :success
  # end
  # 
  # test "should get edit" do
  #   get :edit, id: @user
  #   assert_response :success
  # end
  # 
  # test "should update user" do
  #   put :update, id: @user, user: { birthdate: @user.birthdate, image: @user.image, lastname: @user.lastname, mail: @user.mail, name: @user.name, password: @user.password }
  #   assert_redirected_to user_path(assigns(:user))
  # end
  # 
  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, id: @user
  #   end
  # 
  #   assert_redirected_to users_path
  # end
end
