require 'spec_helper'

describe PostsController do

  include Devise::TestHelpers # to give your spec access to helpers

  context "for REST actions " do   
    before :all do 
      @post = Post.create :content=>"xxxx", :title => "xxxx"
    end
  
    it "creates a new post" do
      lambda {
        post :create, :post=>@post.attributes
      }.should change(Post,:count)
    end

    it "update a post" do
      post :update,:id=>@post.id, :post=>@post.attributes
    end
  
    it "delete a post" do
      post :destroy, :post=>@post        
    end
  end

end