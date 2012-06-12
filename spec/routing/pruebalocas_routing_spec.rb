require "spec_helper"

describe PruebalocasController do
  describe "routing" do

    it "routes to #index" do
      get("/pruebalocas").should route_to("pruebalocas#index")
    end

    it "routes to #new" do
      get("/pruebalocas/new").should route_to("pruebalocas#new")
    end

    it "routes to #show" do
      get("/pruebalocas/1").should route_to("pruebalocas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pruebalocas/1/edit").should route_to("pruebalocas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pruebalocas").should route_to("pruebalocas#create")
    end

    it "routes to #update" do
      put("/pruebalocas/1").should route_to("pruebalocas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pruebalocas/1").should route_to("pruebalocas#destroy", :id => "1")
    end

  end
end
