require 'spec_helper'

describe Post do

  def do_create
    #post :create, :menu_item=>{:name=>"value"}
    post :create, :post=>{:title=>"titulito",:content=>"contenidito",:user_id=>123,:tag=>"taguito"}
  end

  it "creates a new post" do
    #MenuItem.should_receive(:new).with("name"=>"value").and_return(@menu_item)
    Post.should_receive(:new)
    do_create
  end

end