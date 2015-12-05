require 'spec_helper'

describe Client do
  describe "#waiting_list" do
    it "does not include voided clients" do
      create(:client, application_voided: true)
      expect(Client.waiting_list).to be_empty
    end
    it "orders clients by application date" do
      client_2 = create(:client, application_date: 2.weeks.ago)
      client_1 = create(:client, application_date: 3.weeks.ago)
      client_3 = create(:client, application_date: 1.weeks.ago)
      expect(Client.waiting_list).to eq([client_1, client_2, client_3])

    end
    it "does not include completed clients" do
      create(:client, pickup_date: 1.week.ago)
      expect(Client.waiting_list).to be_empty
    end
  end

end
