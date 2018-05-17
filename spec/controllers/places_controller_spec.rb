require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  
  # describe "places#index action" do
  #   it "should list a random selection of 5 places" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "places#new action" do
  #   it "should require users to be logged in" do
  #     get :new
  #     expect(response).to redirect_to new_user_session_path
  #   end

  #   it "should show the new place form" do
  #     user = FactoryBot.create(:user)
  #     sign_in user

  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "places#create action" do
  #   it "should require users to be logged in" do
  #     post :create, params: { place: FactoryBot.attributes_for(:place) }
  #     expect(response).to redirect_to new_user_session_path
  #   end

  #   it "should create a new place in the database" do
  #     user = FactoryBot.create(:user)
  #     sign_in user

  #     post :create, params: { place: { name: "Woodmoor", address: "11529 February Cir, Silver Spring MD 20904", description: "This is the description for the place that I just added" } }
  #     expect(response).to redirect_to root_path

  #     place = Place.last
  #     expect(place.name).to eq("Woodmoor")
  #     expect(place.address).to eq("11529 February Cir, Silver Spring MD 20904")
  #     expect(place.description).to eq("This is the description for the place that I just added")
  #     expect(place.user).to eq(user)
  #   end
  # end

  # describe "places#show action" do
  #   it "should successfully show the place page if the specified place is found" do
  #     place = FactoryBot.create(:place)
  #     get :show, params: { id: place.id }
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "should return a 404 error if the place is not found" do
  #     get :show, params: { id: 'TACOCAT' }
  #     expect(response).to have_http_status(:not_found)
  #   end
  # end

  # describe "places#edit action" do

  #   it "shouldn't allow unauthenticated users access the place edit form" do
  #     place = FactoryBot.create(:place)
  #     get :edit, params: { id: place.id }
  #     expect(response).to redirect_to new_user_session_path
  #   end

  #   it "shouldn't let a user who did not create the place edit a place" do
  #     place = FactoryBot.create(:place)
  #     diff_user = FactoryBot.create(:user)
  #     sign_in diff_user
  #     get :edit, params: { id: place.id }
  #     expect(response).to have_http_status(:forbidden)
  #   end

  #   it "should successfully show the edit form if the place if found" do
  #     place = FactoryBot.create(:place)
  #     sign_in place.user
  #     get :edit, params: { id: place.id }
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "should return a 404 error message if the place is not found" do
  #     user = FactoryBot.create(:user)
  #     sign_in user
  #     get :edit, params: { id: 'WHAT-WHAT' }
  #     expect(response).to have_http_status(:not_found)
  #   end
  # end

  # describe "places#update action" do

  #   it "shouldn't let unauthenticated users update a place" do
  #     place = FactoryBot.create(:place)
  #     patch :update, params: { id: place.id, place: { description: 'Hello!' } }
  #     expect(response).to redirect_to new_user_session_path
  #   end

  #   it "shouldn't allow a user who didn't create a place to update it" do
  #     place = FactoryBot.create(:place)
  #     diff_user = FactoryBot.create(:user)
  #     sign_in diff_user
  #     patch :update, params: { id: place.id, place: { description: 'An Update' } }
  #     expect(response).to have_http_status(:forbidden)
  #   end

  #   it "should allow users to successfully update places" do
  #     place = FactoryBot.create(:place, description: "Initial value Initial value")
  #     sign_in place.user
  #     patch :update, params: { id: place.id, place: { description: 'Changed Initial value Initial value' } }
  #     expect(response).to redirect_to place_path(place)

  #     place.reload
  #     expect(place.description).to eq('Changed Initial value Initial value')
  #   end

  #   it "should return a 404 error if place cannot be found" do
  #     user = FactoryBot.create(:user)
  #     sign_in user
  #     patch :update, params: { id: 'BOOYAH', place: { description: 'Changed' } }
  #     expect(response).to have_http_status(:not_found)
  #   end
  # end

  describe "placess#destroy action" do

    it "shouldn't let unauthenticated users destroy a place" do
      place = FactoryBot.create(:place)
      delete :destroy, params: { id: place.id }
      expect(response).to redirect_to new_user_session_path
    end

    it "shouldn't allow users who didn't create a place to destroy it" do
      place = FactoryBot.create(:place)
      diff_user = FactoryBot.create(:user)
      sign_in diff_user
      delete :destroy, params: { id: place.id }
      expect(response).to have_http_status(:forbidden)
    end

    it "should allow users to successfully delete places" do
      place = FactoryBot.create(:place)
      sign_in place.user
      delete :destroy, params: { id: place.id }
      redirect_to root_path

      place = Place.find_by_id(place.id)
      expect(place).to eq nil
    end

    # COME BACK TO THIS AFTER BUIDLING COMMENTS FACTORY
    # it "should delete all associated comments when a place is deleted" do
    #   place = FactoryBot.create(:place)
    #   sign_in place.user
    #   first_comment = place.comments.first
      
    #   delete :destroy, params: { id: place.id }
    #   redirect_to root_path

    #   expect(first_comment).to eq nil
    # end

    it "should return a 404 error if place with the specified id cannot be found" do
      user_not_owner = FactoryBot.create(:user) # user necessary, else redirected to sign-in page 
      sign_in user_not_owner
      delete :destroy, params: { id: 'SPACEDUCK' }
      expect(response).to have_http_status(:not_found)
    end
  end
end