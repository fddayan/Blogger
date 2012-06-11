# in spec/user_spec.rb
# - RSpec adds ./app/models to the $LOAD_PATH
require "spec_helper"
describe User do
    it "can be instantiated" do
      User.new.should be_an_instance_of(User)
    end

    it "can be saved successfully" do
      user = User.create(:email=>"federico.dayan@globant.com",:password=>"pass123", :name=>"fede",:lastname=>"dayan").should be_persisted
  end
end