require 'rails_helper'
require 'byebug'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'create restaurants' do

    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'an invalid restaurant' do

    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    it 'does not let you submit a name that is too short' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'K'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Error'
      expect(page).not_to have_css 'h2', text: 'kf'
    end
  end

  context 'viewing restaurants' do

    let!(:kfc){Restaurant.create(name:'KFC')}

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'updating restaurants' do

    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    before {Restaurant.create(name:'KFC')}

    scenario 'lets a user update restaurant details' do
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'deleting restaurants' do

    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    before {Restaurant.create(name:'KFC')}

    scenario 'lets a user delete a restaurant' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end
