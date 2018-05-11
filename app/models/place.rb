class Place < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_many :photos, :dependent => :delete_all

  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: { message: "The NAME of the place is required." }, length: { minimum: 3,  maximum: 70 } 
  validates :address, presence: { message: "The ADDRESS of the place is required." }, length: { maximum: 140 }
  validates :description, presence: { message: "The DESCRIPTION of the place is required." }, length: { minimum: 20,  maximum: 500 }
end
