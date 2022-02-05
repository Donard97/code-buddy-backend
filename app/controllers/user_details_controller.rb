class UserDetailsController < ApplicationController
  api :GET, '/users/id/user_details', 'This is the index view for all user details'
  def index
    user = UserDetail.includes(:user).all
    render json: user, adapter: :json_api, status: :ok
  end

  api :POST, '/users/id/user_details', 'Create user details'
  def create
    user_detail = UserDetail.create(user_id: params[:user_id], full_name: params[:full_name], avatar: params[:avatar],
                                    birthday: params[:birthday])
    render json: user_detail, adapter: :json_api, status: :ok if user_detail.save!
  end

  api :PUT, '/users/id/user_details', ' Update user detail'
  def update
    user_detail = UserDetail.find(params[:id])

    respond_to do |format|
      if user_detail.update(full_name: params[:full_name], avatar: params[:avatar],
                            birthday: params[:birthday])
        format.json { render json: user_detail, status: :ok }
      else
        format.json { render json: format_error('Unprocessable entity', user_detail.errors), status: :unprocessable_entity }
      end
    end
  end

  api :GET, '/users/:user_id/meetings', 'To get meetings created by a specific user'
  def meetings
    meetings = User.find(params[:user_id]).meetings
    render json: meetings, adapter: :json_api, status: 200
  end
end
