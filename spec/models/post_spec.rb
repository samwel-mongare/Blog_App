require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  
  it { should validate_presence_of(:text) }

  context "when validating format of attributes" do
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
end

context "when validating format of attributes" do
  it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
end

it 'loads only the recent 5 comments' do
  expect(subject.recent_comments).to eq(subject.comments.last(5))
end
end
