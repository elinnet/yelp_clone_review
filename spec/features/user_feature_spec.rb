require 'rails_helper'

feature "Users can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see a 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "when user is signed in" do

    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    it "should not see a 'sign in' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).to have_link('Sign out')
    end
  end

  context "only logged in users can create restaurants" do

    it "is should return non-logged in users to index page" do
      visit ('/')
      click_link ('Add a restaurant')
      expect(current_path).to eq '/users/sign_in'
    end
  end

  
end
