require 'rails_helper'

RSpec.describe "Api::MeetingTypes", type: :request do
  meeting_type = MeetingType.create(name: "Final Capstone Project", color: "Blue",  image: "https://best-essay-services.com/wp-content/uploads/2020/08/Capstone-Project.jpg", icon: "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png"  )

  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'create a new meeting type' do
      post '/meeting_types?name=Probem Solving'
      expect(response.body).to include('Probem Solving')
    end
  end

  #  describe 'PUT /update' do
  #   it 'update the user' do
  #     put "/meeting_types/1?name=Probem Solving"
  #     expect(response.body).to include('Probem Solving')
  #   end
  # end

  describe 'Delete /delete' do
    it 'delete the meeting type' do
      delete "/meeting_types/#{meeting_type.id}"
      expect(response.status).to eq 200
    end
  end
end
