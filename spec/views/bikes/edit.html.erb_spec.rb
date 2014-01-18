require 'spec_helper'

describe "bikes/edit" do
  before(:each) do
    @bike = assign(:bike, stub_model(Bike))
  end

  it "renders the edit bike form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bike_path(@bike), "post" do
    end
  end
end
