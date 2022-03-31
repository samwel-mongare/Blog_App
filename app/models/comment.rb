class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :update_posts_counter

  def update_posts_counter
    post.increment!(:comments_counter)
  end
end

# Test data...I will delete after prject input fields are created
# Comment.create(post: fifth_post, author: fifth_user, text: 'Hi Sam!' )
# Comment.create(post: fifth_post, author: third_user, text: 'Hi Sam!' )
# Comment.create(post: fourth_post, author: first_user, text: 'Hi Dan!' )
# Comment.create(post: sixth_post, author: fourth_user, text: 'Hi Sam!' )
# Comment.create(post: seventh_post, author: second_user, text: 'Hi Sam!')