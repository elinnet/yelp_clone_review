require 'rails_helper'


feature 'reviewing restaurants' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  before do
    login_as(user, :scope => :user)
    restaurant_add
    click_link 'Sign out'
  end

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

    scenario 'users only allowed to delete the reviews they have created' do
      login_as(user, :scope => :user)
      add_review_to_restaurant
      click_link 'Sign out'
      login_as(user2, :scope => :user)
      visit '/restaurants'
      click_link 'Delete review'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('so so')
      expect(page).to have_content('Only original creator of review can delete this review')
    end

    scenario 'displays an average rating for all reviews' do
      login_as(user, :scope => :user)
      leave_review('so so','3')
      login_as(user2, :scope => :user)
      leave_review('Great','5')
      expect(page).to have_content('Average rating: ★★★★☆')
    end

    def leave_review(thoughts, rating)
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in 'Thoughts', with: thoughts
      select rating, from: 'Rating'
      click_button 'Create Review'
    end
end
