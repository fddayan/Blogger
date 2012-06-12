require 'spec_helper'

describe "pruebalocas/index" do
  before(:each) do
    assign(:pruebalocas, [
      stub_model(Pruebaloca,
        :nombre => "Nombre",
        :pelos => 1
      ),
      stub_model(Pruebaloca,
        :nombre => "Nombre",
        :pelos => 1
      )
    ])
  end

  it "renders a list of pruebalocas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
