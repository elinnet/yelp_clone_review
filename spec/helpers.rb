module Helpers

  def restaurant_add
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'KFC'
    click_button 'Create Restaurant'
  end

  def add_review_to_restaurant
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Create Review'
  end
end
