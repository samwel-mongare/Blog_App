require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }

  context 'when validating format of attributes' do
    it { should validate_numericality_of(:posts_counter).is_greater_than_or_equal_to(0) }
  end

  it 'shows three recent posts' do
    expect(subject.recent_posts).to eq(subject.posts.last(3))
  end
end
