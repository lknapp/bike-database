require 'spec_helper'
describe BikesController do

  describe "GET index" do
    it "assigns all bikes as @bikes" do
      bike = Bike.create! valid_attributes
      get :index, {}, valid_session
      assigns(:bikes).should eq([bike])
    end
  end

  describe "GET show" do
    it "assigns the requested bike as @bike" do
      bike = Bike.create! valid_attributes
      get :show, {:id => bike.to_param}, valid_session
      assigns(:bike).should eq(bike)
    end
  end

  describe "GET new" do
    it "assigns a new bike as @bike" do
      get :new, {}, valid_session
      assigns(:bike).should be_a_new(Bike)
    end
  end

  describe "GET edit" do
    it "assigns the requested bike as @bike" do
      bike = Bike.create! valid_attributes
      get :edit, {:id => bike.to_param}, valid_session
      assigns(:bike).should eq(bike)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bike" do
        expect {
          post :create, {:bike => valid_attributes}, valid_session
        }.to change(Bike, :count).by(1)
      end

      it "assigns a newly created bike as @bike" do
        post :create, {:bike => valid_attributes}, valid_session
        assigns(:bike).should be_a(Bike)
        assigns(:bike).should be_persisted
      end

      it "redirects to the created bike" do
        post :create, {:bike => valid_attributes}, valid_session
        response.should redirect_to(Bike.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bike as @bike" do
        Bike.any_instance.stub(:save).and_return(false)
        post :create, {:bike => {  }}, valid_session
        assigns(:bike).should be_a_new(Bike)
      end

      it "re-renders the 'new' template" do
        Bike.any_instance.stub(:save).and_return(false)
        post :create, {:bike => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bike" do
        bike = Bike.create! valid_attributes
        Bike.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => bike.to_param, :bike => { "these" => "params" }}, valid_session
      end

      it "assigns the requested bike as @bike" do
        bike = Bike.create! valid_attributes
        put :update, {:id => bike.to_param, :bike => valid_attributes}, valid_session
        assigns(:bike).should eq(bike)
      end

      it "redirects to the bike" do
        bike = Bike.create! valid_attributes
        put :update, {:id => bike.to_param, :bike => valid_attributes}, valid_session
        response.should redirect_to(bike)
      end
    end

    describe "with invalid params" do
      it "assigns the bike as @bike" do
        bike = Bike.create! valid_attributes
        Bike.any_instance.stub(:save).and_return(false)
        put :update, {:id => bike.to_param, :bike => {  }}, valid_session
        assigns(:bike).should eq(bike)
      end

      it "re-renders the 'edit' template" do
        bike = Bike.create! valid_attributes
        Bike.any_instance.stub(:save).and_return(false)
        put :update, {:id => bike.to_param, :bike => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bike" do
      bike = Bike.create! valid_attributes
      expect {
        delete :destroy, {:id => bike.to_param}, valid_session
      }.to change(Bike, :count).by(-1)
    end

    it "redirects to the bikes list" do
      bike = Bike.create! valid_attributes
      delete :destroy, {:id => bike.to_param}, valid_session
      response.should redirect_to(bikes_url)
    end
  end

end
