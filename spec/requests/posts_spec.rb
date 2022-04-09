require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # initialize test data
  let(:name) { "simple name" }
  let(:user) { create(:user) }
  let!(:Posts) { create_list(:post, 10) }
  let(:post_id) { Posts.first.id }

  let(:headers) { valid_headers }

  # Test suite for GET /Posts
  describe 'GET /Posts' do
     # update request with headers
     before { get '/Posts', params: {}, headers: headers }

    it 'returns Posts' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /Posts/:id
  describe 'GET /Posts/:id' do
    before { get "/Posts/#{post_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find post/)
      end
    end
  end

  # Test suite for POST /Posts
  describe 'POST /Posts' do
    let(:valid_attributes) do
      # send json payload
      { title: 'Learn Elm', created_by: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/Posts', params: valid_attributes, headers: headers }

      it 'creates a post' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/Posts', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /Posts/:id
  describe 'PUT /Posts/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/Posts/#{post_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /Posts/:id
  describe 'DELETE /Posts/:id' do
    before { delete "/Posts/#{post_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end