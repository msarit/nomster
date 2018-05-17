require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Factories" do
    it "will set the rating" do
      expect(FactoryBot.build(:comment).rating).to be_present
    end
  end
end