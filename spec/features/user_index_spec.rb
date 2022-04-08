require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create(name: 'Sam', photo: 'profile_pic.link', bio: 'bio', posts_counter: 0, email: 'Sam@gmail.com',
                           password: 'password')
      @user2 = User.create(name: 'Diana', bio: 'bio',
                           photo: 'profile_pic.link',
                           email: 'Diana@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'Sam@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Shows the username' do
      expect(page).to have_content('Diana')
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('profile_pic.link')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it "after clicking on the user, it will be redirected to that user's show page" do
      expect(page).to have_content('Number of posts: 0')
      click_on 'Sam'
      expect(page).to have_content('bio')
    end
  end
end
