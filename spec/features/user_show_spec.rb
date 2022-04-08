require 'rails_helper'

RSpec.describe 'user#Show', type: :feature do
  describe 'User' do
    before(:each) do
      @first_user = User.create(name: 'Sam', photo: 'profile_pic.link', bio: 'bio', posts_counter: 0,
                                email: 'Sam@gmail.com', password: 'password')
      @second_user = User.create(name: 'Diana', bio: 'bio', photo: 'profile_pic.link', email: 'Diana@gmail.com',
                                 password: 'password')
      @third_user = User.create(name: 'Tom', bio: 'bio', photo: 'profile_pic.link', email: 'Tom@gmail.com',
                                password: 'password')

      visit new_user_session_path
      fill_in 'Email', with: 'Diana@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      @post2 = Post.create(title: 'Second Post', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      @post3 = Post.create(title: 'Third Post', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      @post4 = Post.create(title: 'Fourth Post', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      visit user_path(@first_user.id)
    end
    it "show user's profile picture" do
      all('img').each do |i|
        expect(i[:src]).to eq('profile_pic.link')
      end
    end

    it "show user's name" do
      expect(page).to have_content 'Sam'
    end

    it 'show number of posts per user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it "show user's bio." do
      expect(page).to have_content('bio')
    end

    it "show user's first 3 posts." do
      expect(page).to have_content 'This is my fourth post'
      expect(page).to have_content 'This is my third post'
      expect(page).to have_content 'This is my second post'
    end

    it "show button that lets me view all of a user's posts." do
      expect(page).to have_link('See all posts')
    end

    it "click post and redirect to that post's show page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)
    end

    it "click see all posts and redirects to user's post's index page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)
    end
  end
end
