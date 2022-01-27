require 'rails_helper'

RSpec.describe 'Api::MeetingTypes', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'create a new meeting type' do
      post '/meeting_types?name=ProbemSolving'
      expect(response.body).to include('ProbemSolving')
    end
  end
end
