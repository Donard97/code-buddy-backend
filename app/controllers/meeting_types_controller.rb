class MeetingTypesController < ApplicationController
  def index
    meeting_types = MeetingType.all
    render json: meeting_types, adapter: :json_api, status: 200
  end

  def show
    meeting_type = MeetingType.find(params[:id])
    render json: meeting_type, adapter: :json_api, status: 200
  end

  def create
    meeting_type = MeetingType.create(name: params[:name], color: params[:color], image: params[:image],
                                      icon: params[:icon])
    render json: meeting_type, adapter: :json_api, status: 200 if meeting_type.save!
  end

  def update
    meeting_type = MeetingType.find(params[:id])

    respond_to do |format|
      if meeting_type.update(name: params[:name], color: params[:color], image: params[:image],
        icon: params[:icon])
        format.json {  render json: meeting_type, status: :ok }
      else
        format.json { render json: meeting_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    meeting_type = MeetingType.find(params[:id])
    meeting_type.destroy
    render json: {message: "Meeting type has been deleted succesfully!", meeting_type: meeting_type.name}, adapter: :json_api, status: 200 if meeting_type.destroy!
  end

  def meetings
    meetings = MeetingType.find(params[:meeting_type_id]).meetings
    render json: meetings, adapter: :json_api, status: 200
  end
end
