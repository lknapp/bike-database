require 'spec_helper'

describe BikesController do

  let(:user){FactoryGirl.create(:user)}
  let(:bike){FactoryGirl.create(:bike)}

  before :each do
    sign_in user
  end

  describe "GET #index" do
    it "assignes unsold bikes" do
      bike = FactoryGirl.create(:bike, date_sold: nil, purpose: "Sale")
      get :index
      expect(assigns(:unsold_bikes)).to eq([bike])
    end
  end

  describe "POST #create" do
    it "creates a new bike with valid credentials" do
      expect{
        post :create, bike: FactoryGirl.attributes_for(:bike)
      }.to change(Bike, :count).by(1)
    end
    it "redirects to new bike path" do
      expect(post :create, bike: FactoryGirl.attributes_for(:bike)).to redirect_to(new_bike_path)
    end
  end

  describe "GET #new" do
    it "assigns a log number" do
      FactoryGirl.create(:bike, log_number: 3)
      get :new
      expect(assigns(:log_number)).to eq(4)
    end
  end


end
