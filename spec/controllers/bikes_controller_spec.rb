require 'spec_helper'

describe BikesController do

  let(:user){ create :user }
  let(:bike){ create :bike }

  before :each do
    sign_in user
  end

  describe "#index" do
    it "assignes unsold bikes" do
      bike = create :bike, date_sold: nil, purpose: "Sale"
      get :index
      expect(assigns(:unsold_bikes)).to eq([bike])
    end
  end

  describe "#create" do
    it "creates a new bike with valid credentials" do
      expect{
        post :create, bike: attributes_for(:bike)
      }.to change(Bike, :count).by(1)
    end
    it "redirects to new bike path" do
      expect(post :create, bike: attributes_for(:bike)).to redirect_to(new_bike_path)
    end
  end


  describe "#new" do
    it "assigns a log number" do
      create :bike, log_number: 3
      get :new
      expect(assigns(:log_number)).to eq(4)
    end
    it "assigns the bike's location to sales floor" do
      create :bike, log_number: 3
      get :new
      expect(assigns(:bike).location).to eq("Sales Floor")
    end
    it "assigns the previous bike" do
      previous_bike = create :bike, log_number: 3
      get :new
      expect(assigns(:previous_bike)).to eq(previous_bike)
    end
  end

  describe "#edit" do
    before do
      @previous_bike = create :bike, log_number: 2
      @current_bike = create :bike, log_number: 3
      @next_bike = create :bike, log_number: 4
    end
    it "assigns the current, previous, and next bikes" do
      get :edit, id: @current_bike.id
      expect(assigns(:previous_bike)).to eq(@previous_bike)
      expect(assigns(:bike)).to eq(@current_bike)
      expect(assigns(:next_bike)).to eq(@next_bike)
    end
    it "assigns a client if there is one" do
      @client = create :client, bike: @current_bike
      get :edit, id: @current_bike.id
      expect(assigns(:client)).to eq(@client)
    end
    it "does not assign a client if there is none" do
      get :edit, id: @current_bike.id
      expect(assigns(:client)).to be_nil
    end
  end

  describe "#update" do
    it "redirects to edit bike path when bike is updated" do
      bike = create :bike
      expect( put :update, id: bike.id, bike: {brand: "foobar"} ).to redirect_to action: :edit, id: assigns(:bike).id
    end
  end

  describe "#mark_as_sold" do
    xit "marks the bike as sold" do
      bike = create :bike, date_sold: Time.now
      allow(bike).to receive(:mark_sold)
      patch :mark_as_sold, id: bike.id
      expect(bike).to have_received(:mark_sold)
    end
    xit "redirects to bikes url with notice if bike sells successfully" do

    end
    xit "renders edit with notice if bike.mark_sold fails" do

    end

  end
end

