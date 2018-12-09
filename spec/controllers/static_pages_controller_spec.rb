require 'spec_helper'

describe StaticPagesController do
  let(:user){FactoryBot.create(:user)}

  before :each do
    sign_in user
  end

  describe "GET bikes_by_location" do
    it "assigns bikes on sales floor excluding freecyclery" do
      create :bike, purpose: Bike::FREECYCLERY, location: Bike::SALES_FLOOR
      sales_bike = create :bike, purpose: Bike::SALE, location: Bike::SALES_FLOOR
      get :bikes_by_location
      expect(assigns(:sales_floor_bikes)).to eq([sales_bike])
    end
    it "assigns bikes in paulina basement excluding freecyclery" do
      create :bike, purpose: Bike::FREECYCLERY, location: Bike::PAULINA_BASEMENT
      sales_bike = create :bike, purpose: Bike::SALE, location: Bike::PAULINA_BASEMENT
      get :bikes_by_location
      expect(assigns(:paulina_basement_bikes)).to eq([sales_bike])
    end
    it "assigns bikes in seward basement excluding freecyclery" do
      create :bike, purpose: Bike::FREECYCLERY, location: Bike::SEWARD_BASEMENT
      sales_bike = create :bike, purpose: Bike::SALE, location: Bike::SEWARD_BASEMENT
      get :bikes_by_location
      expect(assigns(:seward_basement_bikes)).to eq([sales_bike])
    end

  end

  describe "GET sale_bikes" do
    it "assigns bikes with sale purpose that are not sold" do
      create :bike, :sale, date_sold: 2.days.ago
      create :bike, :freecyclery
      sale_bike = create :bike, :sale
      get :sale_bikes
      expect(assigns(:sale_bikes)).to eq([sale_bike])
    end
  end

end
