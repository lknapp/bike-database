require 'spec_helper'

RSpec.describe "Client" do
  context "#waiting_list" do
    it "does not include voided clients" do
      agency = create :agency
      create(:client, agency: agency, application_voided: true)
      expect(Client.waiting_list).to be_empty
    end
    it "orders clients by application date" do
      agency = create :agency
      client_2 = create(:client, agency: agency, application_date: 2.weeks.ago)
      client_1 = create(:client, agency: agency, application_date: 3.weeks.ago)
      client_3 = create(:client, agency: agency, application_date: 1.weeks.ago)
      expect(Client.waiting_list).to eq([client_1, client_2, client_3])

    end
    it "does not include completed clients" do
      agency = create :agency
      create(:client, agency: agency, pickup_date: 1.week.ago)
      expect(Client.waiting_list).to be_empty
    end
  end

  context "#closed_applications" do
    it "orders chronologically by date bike was picked up" do
      agency = create :agency
      client_1 = create(:client, agency: agency, pickup_date: 1.week.ago)
      client_3 = create(:client, agency: agency, pickup_date: 3.week.ago)
      client_2 = create(:client, agency: agency, pickup_date: 2.week.ago)
      expect(Client.closed_applications).to eq([client_1, client_2, client_3])
    end
  end

  context "on update" do

    it "updates client's bike_assigned_date if a bike is assigned" do
      date = Time.zone.now.beginning_of_day
      agency = create :agency
      client = create :client, agency: agency
      bike = create :bike
      Timecop.freeze(date) do
        client.update_attribute(:bike, bike)
        expect(client.reload.assigned_bike_at).to eq(date)
      end
    end

    it "does not update client's bike_assigned_date if a bike is assigned" do
      date = Time.zone.now.beginning_of_day
      agency = create :agency
      client = create :client, agency: agency
      Timecop.freeze(date) do
        client.update_attribute(:first_name, "freddy")
        expect(client.reload.assigned_bike_at).to eq(nil)
      end
    end
  end

end
