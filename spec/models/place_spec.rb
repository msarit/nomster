require 'rails_helper'

RSpec.describe Place, type: :model do
  it "will not be valid with an empty name" do
    place = FactoryBot.build(:place, name: "")

    expect(place).not_to be_valid
  end

  it "will not be valid with a name less than 3 characters" do
    place = FactoryBot.build(:place, name: "Bo")

    expect(place).not_to be_valid
  end

  it "will not be valid with a name more than 70 characters" do
    place = FactoryBot.build(:place, name: "falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk")

    expect(place).not_to be_valid
  end

  it "will not be valid with an empty address" do
    place = FactoryBot.build(:place, address: "")

    expect(place).not_to be_valid
  end

  it "will not be valid with an address more than 140 characters" do
    place = FactoryBot.build(:place, address: "falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk")

    expect(place).not_to be_valid
  end

  it "will not be valid with an empty description" do
    place = FactoryBot.build(:place, description: "")

    expect(place).not_to be_valid
  end

  it "will not be valid with a description less than 20 characters" do
    place = FactoryBot.build(:place, description: "ajbfa fjabfkjabf")

    expect(place).not_to be_valid
  end

  it "will not be valid with a description more than 500 characters" do
    place = FactoryBot.build(:place, description: "falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk falnlj fjbf wjfkjbfkwj wkjfwjnfw fwljfnlwjfk wfwlkfnwlkfnwlkfnwlkfnwlkfnwlk")

    expect(place).not_to be_valid
  end
end