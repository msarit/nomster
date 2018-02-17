class Place < ApplicationRecord
  belongs_to :user
  validates :name, presence: { message: "The NAME of the place is required." }
end
