require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:each) do
      @first_user = User.create(name: 'Sam', photo: 'profile_photo.link', bio: 'bio', posts_counter: 0, email: 'testing@gmail.com',
                           password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'testing@gmail.com'
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
      @comment1 = Comment.create(text: 'Hello Everyone!', author: User.first,post: Post.first)
      @comment2 = Comment.create(text: 'Hello Sam!', author: User.first, post: Post.first)
      @comment3 = Comment.create(text: 'Helloo!', author: User.first, post: Post.first)

      visit(user_posts_path(@first_user.id))
    end

    it "Checking if users's profile picture shows" do
      all('img').each do |i|
        expect(i[:src]).to eq('profile_photo.link')
      end
    end

    it 'shows the users username' do
      expect(page).to have_content('Sam')
    end

    it 'shows number of posts of user has written' do
      post = Post.all
      expect(post.size).to eql(4)
    end

    it 'shows number of posts by user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it 'shows posts title' do
      expect(page).to have_content('First Post')
    end

    it 'can see some of the post detail' do
      expect(page).to have_content 'This is my first post'
    end

    it 'can see the first comment on a post' do
      expect(page).to have_content 'Hello Everyone!'
    end

    it 'can see how many comments a post has.' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'can see how many likes a post has.' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end
  end
end