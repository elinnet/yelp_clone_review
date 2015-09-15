require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it { is_expected.to belong_to :user }

  it 'is not valid with a name of less than two characters' do
    restaurant = Restaurant.new(name: "k")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).to_not be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
end
