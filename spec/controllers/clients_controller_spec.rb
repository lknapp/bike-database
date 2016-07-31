require 'spec_helper'

describe ClientsController do
  let(:user){FactoryGirl.create(:user)}
  let(:client){FactoryGirl.create(:client)}

  before :each do
    sign_in user
  end

  describe "#print_select" do
    it "only assigns clients with a bike and an agency" do
      client_with_bike_and_agency = create :client, bike: create(:bike), agency: create(:agency)
      create :client, bike: create(:bike)
      create :client, agency: create(:agency)
      get :print_select
      expect(assigns(:clients)).to eq [client_with_bike_and_agency]
    end
  end

  describe "PUT #update" do
    xit "updates a client with an application date" do
      put :update, id: client.id, client: {application_date: "12/21/2015"}
      expect(client.reload.application_date.strftime('%m/%d/%Y')).to eq("12/21/2015")
    end
    xit "updates a client with a pickup date" do
      put :update, id: client.id, client: {pickup_date: "12/21/2015"}
      expect(client.reload.pickup_date.strftime('%m/%d/%Y')).to eq("12/21/2015")
    end
  end
end
