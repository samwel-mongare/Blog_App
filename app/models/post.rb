class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, class_name: "like", foreign_key: "post_id"
end
