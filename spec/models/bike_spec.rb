require 'spec_helper'

describe Bike do

  describe "#sold?" do
    it "returns true if the date_sold is present" do
      bike = build :bike, date_sold: Time.zone.now
      expect(bike.sold?).to be true
    end
    it "returns false if date_sold is not present" do
      bike = build :bike
      expect(bike.sold?).to be false
    end
  end

  describe "#post_to_bike_index" do
    it "does not calls BikeIndexLogger if no bike_index_id is present" do
      expect(BikeIndexLogger).not_to receive(:perform_async)
      create(:bike, bike_index_id: nil)
    end

    it "returns true if bike_index_id is present" do
      bike = create(:bike, bike_index_id: 1)
      expect(bike.post_to_bike_index).to be_truthy
    end
  end

  describe "#available_for_freecyclery" do
    it "does not return bikes that are assigned to clients" do
      bike = create :bike, :freecyclery
      create :client, bike_id: bike.id
      expect(Bike.available_for_freecyclery).to be_empty
    end
    it "does not return sales bikes" do
      bike = create :bike, :sale
      create :client, bike_id: bike.id
      expect(Bike.available_for_freecyclery).to be_empty
    end
    it "does return bikes without clients" do
      bike = create :bike, :freecyclery
      expect(Bike.available_for_freecyclery).to include(bike)
    end

  end
end
