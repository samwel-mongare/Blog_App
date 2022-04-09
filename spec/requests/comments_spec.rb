require 'rails_helper'

RSpec.describe 'Comments API' do
  # Initialize the test data
  let(:name) { "simple name" }
  let(:user) { create(:user) }
  let!(:post) { create(:post) }
  let!(:Comments) { create_list(:comment, 20, post_id: post.id) }
  let(:post_id) { post.id }
  let(:id) { Comments.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /posts/:post_id/Comments
  describe 'GET /posts/:post_id/Comments' do
    before { get "/posts/#{post_id}/Comments", params: {}, headers: headers }

    context 'when post exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all post Comments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find post/)
      end
    end
  end

  # Test suite for GET /posts/:post_id/Comments/:id
  describe 'GET /posts/:post_id/Comments/:id' do
    before { get "/posts/#{post_id}/Comments/#{id}", params: {}, headers: headers }

    context 'when post comment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the comment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when post comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find comment/)
      end
    end
  end

  # Test suite for PUT /posts/:post_id/Comments
  describe 'POST /posts/:post_id/Comments' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/posts/#{post_id}/Comments", params: valid_attributes, headers: headers
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/posts/#{post_id}/Comments", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /posts/:post_id/Comments/:id
  describe 'PUT /posts/:post_id/Comments/:id' do
    let(:valid_attributes) { { name: 'Mozart' }.to_json }

    before do
      put "/posts/#{post_id}/Comments/#{id}", params: valid_attributes, headers: headers
    end

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.name).to match(/Mozart/)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find comment/)
      end
    end
  end

  # Test suite for DELETE /posts/:id
  describe 'DELETE /posts/:id' do
    before { delete "/posts/#{post_id}/Comments/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end