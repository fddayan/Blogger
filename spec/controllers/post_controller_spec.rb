require 'spec_helper'

describe PostsController do

  include Devise::TestHelpers # to give your spec access to helpers
  
  def do_create    
    post :create,:post=>{:title=>"titulito"}
  end

  it "creates a new post" do
    do_create
  end

end