class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, class_name: 'like', foreign_key: 'post_id'
  has_many :comments, class_name: 'comment', foreign_key: 'post_id'
  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def latest_posts
    comments.limit(5).order(created_at: :desc)
  end
end

# Test data...I will delete after prject input fields are created
# first_post = Post.create(author: third_user, title: 'Hello Everyone', text: 'This is my fifth post')
# second_post = Post.create(author: third_user, title: 'Hello Everyone', text: 'This is my fifth post')
# third_post = Post.create(author: third_user, title: 'Hello Everyone', text: 'This is my fifth post')
# fourth_post = Post.create(author: third_user, title: 'Hello Everyone', text: 'This is my fifth post')
# fifth_post = Post.create(author: third_user, title: 'Hello Everyone', text: 'This is my fifth post')

# sixth_post = Post.create(author: second_user, title: 'Hello Everyone', text: 'This is my fifth post')
# seventh_post = Post.create(author: first_user, title: 'Hello Everyone', text: 'This is my fifth post')
# eigth_post = Post.create(author: fourth_user, title: 'Hello Everyone', text: 'This is my fifth post')
# ninth_post = Post.create(author: second_user, title: 'Hello Everyone', text: 'This is my fifth post')
# tenth_post = Post.create(author: first_user, title: 'Hello Everyone', text: 'This is my fifth post')
