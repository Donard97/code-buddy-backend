require 'rails_helper'

RSpec.describe "Meetings", type: :request do

  user = User.create([{ user_name: "Donard"}])

  meeting_types = MeetingType.create(
    name: "Problem Solving",
    color: "blue",
    image: "https://billpay.slu.edu/C20197_ustores/web/uploaded_images/store_65/CODING.jpg",
    icon: "https://icons.iconarchive.com/icons/webalys/kameleon.pics/512/Coding-Html-icon.png"
  )

  meetings = Meeting.create(
    title: "Problem Solving",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    color: "blue",
    image: "https://billpay.slu.edu/C20197_ustores/web/uploaded_images/store_65/CODING.jpg",
    link: "www.example.com",
    meeting_type_id: 1,
    user_id: 1
  )

  describe "GET /meetings" do
    it "works! (now write some real specs)" do
      get '/meetings'
      expect(response).to have_http_status(200)
    end
  end

  
  describe 'POST /create' do
    it 'create a new meeting' do
      post "/meetings?title=ProblemSolving&user_id=1&meeting_type_id=1"
      expect(response.body).to include('ProblemSolving')
    end
  end

  describe 'Delete /delete' do
    it 'delete the meeting' do
      delete "/meetings/1"
      expect(response.status).to eq 200
    end
  end
end
