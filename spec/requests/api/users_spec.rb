require 'rails_helper'

RSpec.describe 'Api::Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'create a new user' do
      post '/users?user_name=donard2'
      expect(response.body).to include('donard2')
    end
  end
end
