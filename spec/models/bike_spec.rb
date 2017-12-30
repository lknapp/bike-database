require 'spec_helper'

describe Bike do
  describe "validations" do
    it "is invalid if time_spent is negative" do
      bike = build :bike, time_spent: -3
      expect(bike.valid?).to be false
    end
    it "is invalid if location is not in the list of locations" do
      bike = build :bike, location: "foo"
      expect(bike.valid?).to be false
    end
  end

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

  describe "#mark_sold" do
    it "sets the date sold to the current date" do
      bike = build :bike
      today = Date.today
      Timecop.freeze(today) do
        bike.mark_sold
        expect(bike.date_sold).to eq(today)
      end
    end

    it "sets the location to 'sold'" do
      bike = build :bike, location: Bike::LOCATIONS[0]
      bike.mark_sold
      expect(bike.location).to eq("Sold")
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
    it "returns bikes that were assigned to clients whose application has been voided" do
      bike = create :bike, :freecyclery
      create :client, bike_id: bike.id, application_voided: true
      expect(Bike.available_for_freecyclery).to eq [bike]
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
