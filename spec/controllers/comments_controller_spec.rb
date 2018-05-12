require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
    it "should require users to be logged in" do
      post :create, params: { comment: FactoryBot.attributes_for(:comment) }
      expect(response).to redirect_to new_user_session_path
    end
  end
end