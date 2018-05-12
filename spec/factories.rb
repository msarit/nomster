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
      "PlaceDescription#{d}XXX"
    end
    sequence :address do |a|
      "PlaceAddress#{a}"
    end
    association :user
  end

  factory :comment do
    sequence :message do |n|
      "This is my Comment #{n}"
    end
    association :user
    association :place
  end
end