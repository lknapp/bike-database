require 'spec_helper'

describe Bike do
  it "posts to bike index" do

    WebMock.stub_request(:post, "http://lvh.me:3000/api/v2/bikes?access_token=asdfklkjasfdljkd3asdfjkl2asdf")
      .and_return(:status => 201, :body => {bike: {id: 1}}.to_json, :headers => {})
    bike = create(:bike, bike_index_id: nil)
    expect(bike.bike_index_id).to eq(1)

  end
  it "assigns bike_index_id after posting to bike index" do
    WebMock.stub_request(:post, "http://lvh.me:3000/api/v2/bikes?access_token=asdfklkjasfdljkd3asdfjkl2asdf")
      .and_return(:status => 400, :body => {error: "error"}.to_json, :headers => {})
    bike = create(:bike, bike_index_id: nil)
    expect(bike.bike_index_id).to_not be_present
  end
end
