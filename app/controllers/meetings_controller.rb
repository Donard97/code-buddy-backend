class MeetingsController < ApplicationController
  api :GET, '/meetings', 'This is the index view for all meetings'
  def index
    meetings = Meeting.all
    render json: meetings, adapter: :json_api, status: 200
  end

  api :GET, '/meetings', 'This is the show page for a meeting'
  def show
    meeting = Meeting.find(params[:id])
    render json: meeting, adapter: :json_api, status: 200
  end

  api :POST, '/meetings', 'Create a meeting'
  def create
    meeting = Meeting.create(user_id: params[:user_id], meeting_type_id: params[:meeting_type_id], title: params[:title], description: params[:description],
                             color: params[:color], image: params[:image], link: params[:link], attendee_limit: params[:attendee_limit])
    render json: meeting, adapter: :json_api, status: 200 if meeting.save!
  end

  api :PUT, '/meetings/:id', 'Update a meeting'
  def update
    meeting = Meeting.find(params[:id])

    respond_to do |format|
      if meeting.update(user_id: params[:user_id], meeting_type_id: params[:meeting_type_id], title: params[:title], description: params[:description],
                        color: params[:color], image: params[:image], link: params[:link], attendee_limit: params[:attendee_limit])

        format.json { render json: meeting, status: :ok }
      else
        format.json { render json: meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  api :DELETE, '/meetings/:id', 'Delete a meeting'
  def destroy
    meeting = Meeting.find(params[:id])
    meeting.destroy
    render json: { message: 'Meeting has been deleted succesfully!', meeting: meeting.title }, adapter: :json_api,
           status: 200
  end

  def reservations
    reservations = Reservation.find(meeting_id: params[:id])
    render json: reservations, adapter: :json_api, status: 200
  end
end
