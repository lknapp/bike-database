require 'spec_helper'

RSpec.describe "Bike" do
  context "validations" do
    it "is invalid if time_spent is negative" do
      bike = build :bike, time_spent: -3
      expect(bike.valid?).to be false
    end
    it "is invalid if location is not in the list of locations" do
      bike = build :bike, location: "foo"
      expect(bike.valid?).to be false
    end
    it "is invalid if price is not a number" do
      bike = build :bike, price: "foo"
      expect(bike.valid?).to be false
    end
    it "is invalid if price is negative" do
      bike = build :bike, price: "-5"
      expect(bike.valid?).to be false
    end
  end

  context "#sold?" do
    it "returns true if the date_sold is present" do
      bike = build :bike, date_sold: Time.zone.now
      expect(bike.sold?).to be true
    end
    it "returns false if date_sold is not present" do
      bike = build :bike
      expect(bike.sold?).to be false
    end
  end

  context "#mark_sold" do
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

  context "#available_for_freecyclery" do
    it "does not return bikes that are assigned to clients" do
      bike = create :bike, :freecyclery
      agency = create :agency
      create :client, bike_id: bike.id, agency: agency
      expect(Bike.available_for_freecyclery).to be_empty
    end
    it "returns bikes that were assigned to clients whose application has been voided" do
      bike = create :bike, :freecyclery
      agency = create :agency
      create :client, bike_id: bike.id, agency: agency, application_voided: true
      expect(Bike.available_for_freecyclery).to eq [bike]
    end
    it "does not return sales bikes" do
      bike = create :bike, :sale
      agency = create :agency
      create :client, bike_id: bike.id, agency: agency
      expect(Bike.available_for_freecyclery).to be_empty
    end
    it "does return bikes without clients" do
      bike = create :bike, :freecyclery
      expect(Bike.available_for_freecyclery).to include(bike)
    end

  end

  context "CSV exports" do
    it "exports with log number, color, model, brand, type for reconciliation" do
      bike = create :bike
      expect(Bike.to_csv_for_reconciliation).to eq("log_number,color,brand,model,bike_type\n#{bike.log_number},#{bike.color},#{bike.brand},#{bike.model},#{bike.bike_type}\n")
    end
    it "exports with all attributes for generic export" do
      bike = create :bike
      expect(Bike.to_csv).to eq("id,brand,model,bike_type,color,serial_number,work_done,new_parts,price,created_at,updated_at,seat_tube_size,top_tube_size,log_number,purpose,mechanic,date_sold,bike_index_id,fixed_at,time_spent,location\n#{bike.id},Schwinn,Madison,Fixed Gear,Yellow,#{bike.serial_number},,,,#{bike.created_at},#{bike.updated_at},,,#{bike.log_number},,,,#{bike.bike_index_id},,,Seward Basement\n")
    end
  end
end
