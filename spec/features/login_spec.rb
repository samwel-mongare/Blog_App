require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  scenario 'displays password field and has log in field' do
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
  end

  scenario 'Submit form with incorrect email and password' do
    visit new_user_session_path
    fill_in 'Email', with: 'testing@gmail.com'
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Submit form with correct email and password' do
    @user = User.create(name: 'Sam', email: 'sam@gmail.com', password: 'password')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  context 'Form Submission' do
    scenario 'Submit an empty form' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end
