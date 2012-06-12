require 'spec_helper'

describe PostsController do

  include Devise::TestHelpers # to give your spec access to helpers

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  before(:each) do
    # mock up an authentication in the underlying warden library
    request.env['warden'] = mock(User, :authenticate => mock_user,
                                       :authenticate! => mock_user)
  end

  def do_create    
    post :create,:post=>{:title=>"titulito"}
  end

  it "creates a new post" do
    #MenuItem.should_receive(:new).with("name"=>"value").and_return(@menu_item)
    #Post.should_receive(:new)
    do_create
  end

end