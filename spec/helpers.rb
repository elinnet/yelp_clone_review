module Helpers
  def sign_up
    visit '/users/sign_up'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'pasword_confirmation', with: '12345678'
    click_button 'Sign up'
  end
end
