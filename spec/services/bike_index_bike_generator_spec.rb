require 'spec_helper'

describe BikeIndexBikeGenerator do
  it "creates a bike with required attributes" do
    bike = create(:bike)

    bikeIndexBikeJson = BikeIndexBikeGenerator.create_bike_index_bike(bike)

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
      bike = create(:bike, purpose: "freecyclery")
      bikeIndexBikeJson = BikeIndexBikeGenerator.create_bike_index_bike(bike)

      bikeIndexBike = JSON.parse(bikeIndexBikeJson)

      expect(bikeIndexBike["is_for_sale"]).to be_falsey
    end
  end

  describe "sale bikes" do
    it "is_for_sale is true" do
      bike = create(:bike, purpose: "sale")
      bikeIndexBikeJson = BikeIndexBikeGenerator.create_bike_index_bike(bike)

      bikeIndexBike = JSON.parse(bikeIndexBikeJson)

      expect(bikeIndexBike["is_for_sale"]).to be_truthy
    end
  end

end
