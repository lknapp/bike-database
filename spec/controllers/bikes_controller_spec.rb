require 'spec_helper'
describe BikesController do

  let(:user){FactoryGirl.create(:user)}
  let(:bike){FactoryGirl.create(:bike)}

  before :each do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return true
  end

  describe "POST #create" do
    it "creates a new bike with valid credentials" do
      expect{post :create, bike: FactoryGirl.attributes_for(:bike)}.to change(Bike, :count).by(1)
    end
  end

end
