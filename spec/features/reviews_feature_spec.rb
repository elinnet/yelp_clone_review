require 'rails_helper'


feature 'reviewing restaurants' do
  before {Restaurant.create name: 'KFC'}
  let(:user) { FactoryGirl.create(:user) }

    scenario 'only logged in users can add reviews' do
      visit '/restaurants'
      click_link 'Review KFC'
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'users can add reviews' do
      login_as(user, :scope => :user)
      add_review_to_restaurant
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'so so'
    end

    scenario 'allows users to delete a review' do
      login_as(user, :scope => :user)
      add_review_to_restaurant
      visit '/restaurants'
      expect{ click_link 'Delete review' }.to change { Review.count }.by(-1)
      expect(current_path).to eq '/restaurants'
      expect(page).not_to have_content('so so')
    end





    # scenario 'does not allow users to delete a review they have not authored' do
    #
    #   another_user = FactoryGirl.create(:user)
    #   login_as(another_user, :scope => :user)
    #   visit '/'
    #   expect{ click_link 'Delete review' }.not_to change{ Review.count }
    #   expect(current_path).to eq '/restaurants'
    #   expect(page).to have_content('You are not the author of this review')
    # end

end
