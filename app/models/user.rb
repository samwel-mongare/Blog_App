class User < ApplicationRecord
  has_many :comments, class_name: "comment", foreign_key: "author_id"
  has_many :posts, class_name: "post", foreign_key: "author_id"
  has_many :likes, class_name: "like", foreign_key: "author_id"

  def latest_posts
    posts.limit(3).order(created_at: :desc)
  end
end
