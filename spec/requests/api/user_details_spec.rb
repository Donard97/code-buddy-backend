require 'rails_helper'

RSpec.describe "Api::UserDetails", type: :request do

  describe "GET /api/user_details" do
    it "works! (now write some real specs)" do
      get '/users/1/user_details'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'add user details' do
      post '/users/1/user_details?full_name=Donard Golaj'
      expect(response.body).to include('Donard Golaj')
    end
  end

  describe 'POST /create' do
    it 'show user meetings' do
      get "/users/1/meetings"
      expect(response.body).to include("Problem Solving")
    end
  end
end
