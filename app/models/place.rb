class Place < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_many :photos, :dependent => :delete_all

  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: { message: "The NAME of the place is required." }, length: { minimum: 3, too_short: "Name must be at least %{count} characters.", maximum: 70 } 
  validates :address, presence: { message: "The ADDRESS of the place is required." }, length: { maximum: 140 }
  validates :description, presence: { message: "The DESCRIPTION of the place is required." }, length: { minimum: 20, too_short: "Description too short.", maximum: 300 }
end
