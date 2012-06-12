require 'spec_helper'

describe "pruebalocas/edit" do
  before(:each) do
    @pruebaloca = assign(:pruebaloca, stub_model(Pruebaloca,
      :nombre => "MyString",
      :pelos => 1
    ))
  end

  it "renders the edit pruebaloca form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pruebalocas_path(@pruebaloca), :method => "post" do
      assert_select "input#pruebaloca_nombre", :name => "pruebaloca[nombre]"
      assert_select "input#pruebaloca_pelos", :name => "pruebaloca[pelos]"
    end
  end
end
