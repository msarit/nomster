class Place < ApplicationRecord
  belongs_to :user
  validates :name, presence: { message: "The NAME of the place is required." }, length: { minimum: 3, too_short: "Name must be at least %{count} characters." }
  validates :address, presence: { message: "The ADDRESS of the place is required." }
  validates :description, presence: { message: "The DESCRIPTION of the place is required." }
end
