require 'spec_helper'

describe Post do
  it "creates a new post" do
    #@user = User.create :mail=>"fer@mail.com",:password=>"pass123", :name=>"fer",:lastname=>"vitale" 

    post = Post.new :title=>"titulito de test",:content=>"contenido de test",:user_id=>123
    post.title.should eq("titulito de test")
    post.content.should eq("contenido de test")
    post.user_id.should_not == nil

    #assert_response 302
    #assert_redirected_to "/users/#{@user.id}"
  end
end