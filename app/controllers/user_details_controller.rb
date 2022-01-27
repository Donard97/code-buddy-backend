class UserDetailsController < ApplicationController
  def index
    user = UserDetail.includes(:user).all
    render json: user, adapter: :json_api, status: 200
  end

  def create
    user_detail = UserDetail.create(user_id: params[:user_id], full_name: params[:full_name], avatar: params[:avatar],
                                    birthday: params[:birthday])
    render json: user_detail, adapter: :json_api, status: 200 if user_detail.save!
  end

  def update
    user_detail = UserDetail.find(params[:id])

    respond_to do |format|
      if user_detail.update(full_name: params[:full_name], avatar: params[:avatar],
                            birthday: params[:birthday])
        format.json { render json: user_detail, status: :ok }
      else
        format.json { render json: user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user_detail = UserDetail.find(params[:id])
    user_detail.destroy
    user_name = User.find(user_detail.user_id).user_name
    render json: { message: 'User detail has been deleted succesfully!', user_name: user_name }, adapter: :json_api,
           status: 200
  end

  def meetings
    meetings = User.find(params[:user_id]).meetings
    render json: meetings, adapter: :json_api, status: 200
  end
end
