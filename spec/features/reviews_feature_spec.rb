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
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'Not too bad'
      select '3', from: 'Rating'
      click_button 'Create Review'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Not too bad'
    end

end
