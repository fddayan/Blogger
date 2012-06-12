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

  it "should be redirect" do
    do_create
    response.should be_redirect
  end

end