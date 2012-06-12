require 'spec_helper'

describe "tests/edit" do
  before(:each) do
    @test = assign(:test, stub_model(Test,
      :nombre => "MyString",
      :pelos => 1
    ))
  end

  it "renders the edit test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tests_path(@test), :method => "post" do
      assert_select "input#test_nombre", :name => "test[nombre]"
      assert_select "input#test_pelos", :name => "test[pelos]"
    end
  end
end
