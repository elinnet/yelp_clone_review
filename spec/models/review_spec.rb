require 'spec_helper'

describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }

  it { is_expected.to belong_to :user }

  it 'should not have a rating of more than 5' do
    review = Review.new(rating:10)
    expect(review).to have(1).error_on(:rating)
  end

end
