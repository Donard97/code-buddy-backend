class MeetingTypesController < ApplicationController
  api :GET, '/meeting_types', 'This is the index view for all meeting types'
  def index
    meeting_types = MeetingType.all
    render json: meeting_types, adapter: :json_api, status: :ok
  end

  api :GET, '/meeting_types', 'Gets the show page for a meeting type'
  def show
    meeting_type = MeetingType.find(params[:id])
    render json: meeting_type, adapter: :json_api, status: :ok
  end

  api :POST, '/meeting_types', 'Create a meeting type'
  def create
    meeting_type = MeetingType.create(name: params[:name], color: params[:color], image: params[:image],
                                      icon: params[:icon])
    render json: meeting_type, adapter: :json_api, status: :ok if meeting_type.save!
  end

  api :PUT, '/meeting_types/:id', 'Update a meeting type'
  def update
    meeting_type = MeetingType.find(params[:id])

    respond_to do |format|
      if meeting_type.update(name: params[:name], color: params[:color], image: params[:image],
                             icon: params[:icon])
        format.json { render json: meeting_type, status: :ok }
      else
        format.json { render json: format_error('Unprocessable entity', meeting_type.errors), status: :unprocessable_entity }
      end
    end
  end

  def meetings
    meetings = MeetingType.find(params[:meeting_type_id]).meetings
    render json: meetings, adapter: :json_api, status: :ok
  end
end
