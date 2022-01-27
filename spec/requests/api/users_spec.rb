require 'rails_helper'

RSpec.describe 'Api::Users', type: :request do
  user = User.create(user_name: 'Donard')

  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'create a new user' do
      post '/users?user_name="Donard"'
      expect(response.body).to include('Donard')
    end
  end

  describe 'Delete /delete' do
    it 'delete the user' do
      delete "/users/#{user.id}"
      expect(response.status).to eq 200
    end
  end
end
