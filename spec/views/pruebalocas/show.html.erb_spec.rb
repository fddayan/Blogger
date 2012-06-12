require 'spec_helper'

describe "pruebalocas/show" do
  before(:each) do
    @pruebaloca = assign(:pruebaloca, stub_model(Pruebaloca,
      :nombre => "Nombre",
      :pelos => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/1/)
  end
end
