# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET posts' do
#     before(:each) { get '/users/3/posts' }

#     it 'has a 200 success status code' do
#       expect(response).to have_http_status(200)
#     end

#     it 'should render the correct template' do
#       expect(response).to render_template('posts/index')
#     end

#     it 'should test heading text displayed inside template' do
#       expect(response.body).to include('Here is a list of posts for a given user index')
#     end
#   end

#   describe 'GET show' do
#     before(:each) { get '/users/3/posts/10' }

#     it 'Should be 200' do
#       expect(response).to have_http_status(200)
#     end

#     it 'should render the correct template' do
#       expect(response).to render_template('posts/show')
#     end

#     it 'should test heading text displayed inside template' do
#       expect(response.body).to include('Here is a list of posts for a given user show')
#     end
#   end
# end
