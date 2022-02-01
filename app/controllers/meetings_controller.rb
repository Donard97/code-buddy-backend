class MeetingsController < ApplicationController
  def index
    meetings = Meeting.all
    render json: meetings, adapter: :json_api, status: :ok
  end

  def show
    meeting = Meeting.find(params[:id])
    render json: meeting, adapter: :json_api, status: :ok
  end

  def create
    meeting = Meeting.create(user_id: params[:user_id], meeting_type_id: params[:meeting_type_id], title: params[:title], description: params[:description],
                             color: params[:color], image: params[:image], link: params[:link], attendee_limit: params[:attendee_limit])
    render json: meeting, adapter: :json_api, status: :ok if meeting.save!
  end

  def update
    meeting = Meeting.find(params[:id])

    respond_to do |format|
      if meeting.update(user_id: params[:user_id], meeting_type_id: params[:meeting_type_id], title: params[:title], description: params[:description],
                        color: params[:color], image: params[:image], link: params[:link], attendee_limit: params[:attendee_limit])

        format.json { render json: meeting, status: :ok }
      else
        format.json { render json: format_error('Unprocessable entity', meeting.errors), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    meeting = Meeting.find(params[:id])
    meeting.destroy
    render json: { message: 'Meeting has been deleted succesfully!', meeting: meeting.title }, adapter: :json_api,
           status: :ok
  end

  def reservations
    reservations = Reservation.find(meeting_id: params[:id])
    render json: reservations, adapter: :json_api, status: :ok
  end
end
