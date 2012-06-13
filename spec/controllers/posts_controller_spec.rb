require 'spec_helper'

describe PostsController do

  include Devise::TestHelpers # to give your spec access to helpers
  
  def do_create    
    post :create,:post=>{:title=>"titulito"}
  end

  it "creates a new post" do
    Post.should_receive(:new).with("title"=>"titulito").and_return(@post)
    do_create
  end

  def do_update    
    @postTest = post :create,:post=>{:title=>"titulito"}
    post :update, :post=>@postTest, :title=>"nuevo"    
    @postTest.title.should eq(["nuevo"])
  end

  it "update a post" do
    do_update    
  end

  def do_destroy
    @postTest = post :create,:post=>{:title=>"titulito"}
    post :destroy, :post=>@postTest        
  end

  it "delete a post" do
    do_destroy    
  end

  it "should be redirect" do
    do_create
    response.should be_redirect
  end

end