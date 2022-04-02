require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'updates a posts likes correctly' do
    user = User.create(name: 'Sam', posts_counter: 0)
    post = user.posts.create(title: 'Post1', text: 'Howdy code reviewer', likes_counter: 0, comments_counter: 0)
    post.likes.create(author_id: user.id, post_id: post.id)
    expect(post.likes_counter).to eql(1)
  end
end
