require 'spec_helper'

RSpec.describe ClientsController do
  let(:user){FactoryBot.create(:user)}
  let(:client){FactoryBot.create(:client)}
  let(:bike){FactoryBot.create(:bike)}

  before :each do
    sign_in user
  end

  context "POST #create" do
    it "redirects to new_client_path on success" do
      client_attributes = attributes_for :client
      request = post :create, client: client_attributes
      expect(request).to redirect_to action: :new
    end
  end

  context "#print_select" do
    it "only assigns clients with a bike and an agency" do
      client_with_bike_and_agency = create :client, bike: create(:bike), agency: create(:agency)
      create :client, bike: create(:bike)
      create :client, agency: create(:agency)
      get :print_select
      expect(assigns(:clients)).to eq [client_with_bike_and_agency]
    end
    it "orders by assigned_bike_at if present" do
      client_0 = create :client, bike: create(:bike), agency: create(:agency), assigned_bike_at: 3.days.ago, application_date: 1.day.ago
      client_1 = create :client, bike: create(:bike), agency: create(:agency), assigned_bike_at: 2.days.ago, application_date: 2.days.ago
      client_2 = create :client, bike: create(:bike), agency: create(:agency), assigned_bike_at: 1.day.ago, application_date: 5.days.ago
      client_3 = create :client, bike: create(:bike), agency: create(:agency), assigned_bike_at: nil, application_date: 4.day.ago
      get :print_select
      expect(assigns(:clients)).to eq [client_2, client_1, client_0, client_3]
    end
  end

  context "PUT #update" do
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
