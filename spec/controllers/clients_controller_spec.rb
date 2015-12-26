require 'spec_helper'

describe ClientsController do
  let(:user){FactoryGirl.create(:user)}
  let(:client){FactoryGirl.create(:client)}

  before :each do
    sign_in user
  end

  describe "PUT #update" do
    it "updates a client with an application date" do
      put :update, id: client.id, client: {application_date: "12/21/2015"}
      expect(client.reload.application_date.strftime('%m/%d/%Y')).to eq("12/21/2015")
    end
  end
end
