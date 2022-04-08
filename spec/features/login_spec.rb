require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  scenario 'displays password field' do
    expect(page).to have_field('user[password]')
  end

  scenario 'displays email field' do
    expect(page).to have_button('Log in')
  end

  context 'Form Submission' do
    scenario 'Submit an empty form' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end