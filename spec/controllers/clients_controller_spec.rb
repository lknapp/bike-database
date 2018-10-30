require 'spec_helper'

describe ClientsController do
  let(:user){FactoryBot.create(:user)}
  let(:client){FactoryBot.create(:client)}

  before :each do
    sign_in user
  end

  describe "POST #create" do
    it "redirects to new_client_path on success" do
      client_attributes = attributes_for :client
      request = post :create, client: client_attributes
      expect(request).to redirect_to action: :new
    end
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
    it "updates a client with an application date" do
      date = Time.zone.now.beginning_of_day
      put :update, id: client.id, client: {application_date: date.strftime('%m/%d/%Y')}
      expect(client.reload.application_date).to eq(date)
    end

    it "updates a client with a pickup date" do
      date = Time.zone.now.beginning_of_day
      put :update, id: client.id, client: {pickup_date: date.strftime('%m/%d/%Y')}
      expect(client.reload.pickup_date).to eq(date)
    end
  end
end
