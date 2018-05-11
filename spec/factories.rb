FactoryBot.define do
  factory :user do
    sequence :username do |u|
      "User#{u}"
    end
    sequence :email do |n|
      "aritfirehose+emailtest#{n}@gmail.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"
  end

  factory :place do
    sequence :name do |n|
      "PlaceName#{n}"
    end
    sequence :description do |d|
      "PlaceDescription#{d}"
    end
    sequence :address do |a|
      "PlaceAddress#{a}"
    end
    association :user
  end
end