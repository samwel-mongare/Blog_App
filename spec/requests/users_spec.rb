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
      expect(response.body).to include('Here is a user with a unique id from a list of users index')
    end
  end

  describe 'GET show' do
    before(:each) { get '/users/:user_id' }

    it 'Should be 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template('users/show')
    end

    it 'should test heading text displayed inside template' do
      expect(response.body).to include('Here is a user with a unique id from a lsit of users show')
    end
  end
end
