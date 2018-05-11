require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe "places#index action" do
    it "should list a random selection of 5 places" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end