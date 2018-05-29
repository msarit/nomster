require 'rails_helper'
require File.expand_path('../../config/environment', __FILE__)

RSpec.describe Photo, type: :model do
  describe "Factories" do
    it "will attach a photo" do
      expect(FactoryBot.build(:photo).picture).to be_present
    end
  end
end