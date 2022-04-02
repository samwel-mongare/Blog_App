require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users' do
    before(:each) { get '/users' }

    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template('users/index')
    end

    it 'should test heading text displayed inside template' do
      expect(response.body).to include('Blog APP')
    end
  end

  describe 'GET show' do
    user = User.create(name: 'Sam', posts_counter: 0)
    before(:each) { get user_path id: user.id }

    it 'Should be 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template('users/show')
    end

    it 'should test heading text displayed inside template' do
      expect(response.body).to include('Blog APP')
    end
  end
end
