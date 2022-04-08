require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'Post' do
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

      @comment1 = Comment.create(text: 'Hello Everyone!', author: User.first, post: Post.first)
      @comment2 = Comment.create(text: 'Hello Sam!', author: User.first, post: Post.first)
      @comment3 = Comment.create(text: 'Helloo!', author: User.first, post: Post.first)
      visit user_post_path(@first_user, @post1)
    end

    it 'shows posts title' do
      expect(page).to have_content('First Post')
    end

    it 'shows the person who wrote the post' do
      expect(page).to have_content('Sam')
    end

    it 'shows number of comments' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'shows number of likes' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it 'can see the post\'s body.' do
      expect(page).to have_content('Hello Everyone!')
    end

    it 'can see the username of each commentor.' do
      post = Post.first
      comment = post.comments.first
      expect(page).to have_content(comment.author.name)
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'Hello Everyone!'
      expect(page).to have_content 'Hello Sam!'
      expect(page).to have_content 'Helloo!'
    end
  end
end
