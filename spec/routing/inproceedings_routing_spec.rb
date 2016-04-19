require "rails_helper"

RSpec.describe InproceedingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inproceedings").to route_to("inproceedings#index")
    end

    it "routes to #new" do
      expect(:get => "/inproceedings/new").to route_to("inproceedings#new")
    end

    it "routes to #show" do
      expect(:get => "/inproceedings/1").to route_to("inproceedings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inproceedings/1/edit").to route_to("inproceedings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inproceedings").to route_to("inproceedings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inproceedings/1").to route_to("inproceedings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inproceedings/1").to route_to("inproceedings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inproceedings/1").to route_to("inproceedings#destroy", :id => "1")
    end

  end
end
