class User < ApplicationRecord
  has_many :comments, class_name: 'comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'post', foreign_key: 'author_id'
  has_many :likes, class_name: 'like', foreign_key: 'author_id'

  def latest_posts
    posts.limit(3).order(created_at: :desc)
  end
end

# Test data...I will delete after prject input fields are created
# first_user = User.create(name: 'Sam', photo: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg', bio: 'Teacher from Kenya.')
# second_user = User.create(name: 'Dan', photo: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg', bio: 'Teacher from Uganda.')
# third_user = User.create(name: 'Amkam', photo: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg', bio: 'Teacher from Mexico.')
# fourth_user = User.create(name: 'Anne', photo: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg', bio: 'Teacher from England.')
# fifth_user = User.create(name: 'Naomi', photo: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg', bio: 'Teacher from Germany.')