require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe "places#index action" do
    it "should list a random selection of 5 places" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "places#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should show the new place form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "places#create action" do
    it "should require users to be logged in" do
      post :create, params: { place: FactoryBot.attributes_for(:place) }
      expect(response).to redirect_to new_user_session_path
    end

    it "should create a new place in the database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { place: { name: "Woodmoor", address: "11529 February Cir, Silver Spring MD 20904", description: "This is the description for the place that I just added" } }
      expect(response).to redirect_to root_path

      place = Place.last
      expect(place.name).to eq("Woodmoor")
      expect(place.address).to eq("11529 February Cir, Silver Spring MD 20904")
      expect(place.description).to eq("This is the description for the place that I just added")
      expect(place.user).to eq(user)
    end
  end

  describe "places#show action" do
    it "should successfully show the place page if the specified place is found" do
      place = FactoryBot.create(:place)
      get :show, params: { id: place.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the place is not found" do
      get :show, params: { id: 'TACOCAT' }
      expect(response).to have_http_status(:not_found)
    end
  end
end