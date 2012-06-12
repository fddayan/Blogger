require 'spec_helper'

describe "tests/index" do
  before(:each) do
    assign(:tests, [
      stub_model(Test,
        :nombre => "Nombre",
        :pelos => 1
      ),
      stub_model(Test,
        :nombre => "Nombre",
        :pelos => 1
      )
    ])
  end

  it "renders a list of tests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
