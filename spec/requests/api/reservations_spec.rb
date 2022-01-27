require 'rails_helper'

RSpec.describe "Api::Reservations", type: :request do
  describe "GET /api/reservations" do
    it "works! (now write some real specs)" do
      get '/users/1/reservations'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'create a new reservations' do
      post '/users/1/reservations?user_id=1&meeting_id=1'
      expect(response.body).to include('user_id')
    end
  end
end
