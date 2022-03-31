class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def latest_posts
    comments.limit(5).order(created_at: :desc)
  end
end
