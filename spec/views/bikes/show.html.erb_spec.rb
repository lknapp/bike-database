require 'spec_helper'

describe "bikes/show" do
  before(:each) do
    @bike = assign(:bike, stub_model(Bike))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
