require 'spec_helper'

describe "pruebalocas/new" do
  before(:each) do
    assign(:pruebaloca, stub_model(Pruebaloca,
      :nombre => "MyString",
      :pelos => 1
    ).as_new_record)
  end

  it "renders new pruebaloca form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pruebalocas_path, :method => "post" do
      assert_select "input#pruebaloca_nombre", :name => "pruebaloca[nombre]"
      assert_select "input#pruebaloca_pelos", :name => "pruebaloca[pelos]"
    end
  end
end
