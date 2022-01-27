require 'rails_helper'

RSpec.describe 'Meetings', type: :request do
  describe 'GET /meetings' do
    it 'works! (now write some real specs)' do
      get '/meetings'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'create a new meeting' do
      post '/meetings?title=ProblemSolving&user_id=1&meeting_type_id=1'
      expect(response.body).to include('ProblemSolving')
    end
  end

  describe 'Delete /delete' do
    it 'delete the meeting' do
      delete '/meetings/1'
      expect(response.status).to eq 200
    end
  end
end
