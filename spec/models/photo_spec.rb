require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "Factories" do
    it "will attach a photo" do
      expect(FactoryBot.build(:photo).picture).to be_present
    end
  end
end