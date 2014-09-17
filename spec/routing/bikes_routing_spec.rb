require "spec_helper"

describe BikesController do
  describe "routing" do

    it "routes to #index" do
      get("/bikes").should route_to("bikes#index")
    end

    it "routes to #new" do
      get("/bikes/new").should route_to("bikes#new")
    end

    it "routes to #show" do
      get("/bikes/1").should route_to("bikes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bikes/1/edit").should route_to("bikes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bikes").should route_to("bikes#create")
    end

    it "routes to #update" do
      put("/bikes/1").should route_to("bikes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bikes/1").should route_to("bikes#destroy", :id => "1")
    end

  end
end
