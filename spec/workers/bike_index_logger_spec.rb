require 'spec_helper'

describe BikeIndexLogger do
  context "#create_bike_index_bike" do
   it "creates a bike with required attributes" do
     bike = build(:bike)
     allow(Bike).to receive(:find).and_return(bike)

     bikeIndexBikeJson = BikeIndexLogger.create_bike_index_bike(bike)

     bikeIndexBike = JSON.parse(bikeIndexBikeJson)

     expect(bikeIndexBike["serial"]).to eq(bike.serial_number)
     expect(bikeIndexBike["manufacturer"]).to eq(bike.brand)
     expect(bikeIndexBike["frame_model"]).to eq(bike.model)
     expect(bikeIndexBike["owner_email"]).to eq(ENV["OWNER_EMAIL"])
     expect(bikeIndexBike["no_notify"]).to be_truthy
     expect(bikeIndexBike["color"]).to eq(bike.color)

   end

   describe "freecyclery bikes" do
     it "is_for_sale is false" do
       bike = build(:bike, purpose: "freecyclery")
       allow(Bike).to receive(:find).and_return(bike)
       bikeIndexBikeJson = BikeIndexLogger.create_bike_index_bike(bike)
       bikeIndexBike = JSON.parse(bikeIndexBikeJson)
       expect(bikeIndexBike["is_for_sale"]).to be_falsey
     end
   end

   describe "sale bikes" do
     it "is_for_sale is true" do
       bike = build(:bike, purpose: "sale")
       allow(Bike).to receive(:find).and_return(bike)
       bikeIndexBikeJson = BikeIndexLogger.create_bike_index_bike(bike)
       bikeIndexBike = JSON.parse(bikeIndexBikeJson)
       expect(bikeIndexBike["is_for_sale"]).to be_truthy
     end
   end
  end

  it "assigns bike_index_id on successful response from bike index" do
    WebMock.stub_request(:post, "http://lvh.me:3000/api/v2/bikes?access_token=asdfklkjasfdljkd3asdfjkl2asdf")
      .and_return(:status => 201, :body => {bike: {id: 1}}.to_json, :headers => {})
    allow_any_instance_of(Bike).to receive(:post_to_bike_index)
    bike = create(:bike, bike_index_id: nil)
    allow(Bike).to receive(:find).and_return(bike)
    BikeIndexLogger.new.perform(bike.id)
    expect(bike.bike_index_id).to eq(1)
  end

  it "does not assign bike_index_id on unsuccessful response from bike index" do
    WebMock.stub_request(:post, "http://lvh.me:3000/api/v2/bikes?access_token=asdfklkjasfdljkd3asdfjkl2asdf")
      .and_return(:status => 400, :body => {error: "error"}.to_json, :headers => {})
    allow_any_instance_of(Bike).to receive(:post_to_bike_index)
    bike = create(:bike, bike_index_id: nil)
    allow(Bike).to receive(:find).and_return(bike)
    BikeIndexLogger.new.perform(bike.id)
    expect(bike.bike_index_id).to_not be_present
  end

end
