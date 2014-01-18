require 'spec_helper'

describe "bikes/new" do
  before(:each) do
    assign(:bike, stub_model(Bike).as_new_record)
  end

  it "renders new bike form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bikes_path, "post" do
    end
  end
end
