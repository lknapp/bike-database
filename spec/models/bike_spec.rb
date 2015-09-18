require 'spec_helper'

describe Bike do
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
end
