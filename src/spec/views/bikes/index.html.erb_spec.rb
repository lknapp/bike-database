require 'spec_helper'

describe "bikes/index" do
  before(:each) do
    assign(:bikes, [
      stub_model(Bike),
      stub_model(Bike)
    ])
  end

  it "renders a list of bikes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
