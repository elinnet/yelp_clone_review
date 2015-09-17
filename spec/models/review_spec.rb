require 'spec_helper'

describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }

  it { is_expected.to belong_to :user }

  it 'should not have a rating of more than 5' do
    review = Review.new(rating:10)
    expect(review).to have(1).error_on(:rating)
  end

  it 'removed from database when restaurant deleted' do
    restaurant = Restaurant.create(name: 'KFC')
    review = restaurant.reviews.create(thoughts: 'so so', rating: 3)
    restaurant.destroy
    expect(Review.find_by(thoughts:'so so')).to eq nil
  end



end
