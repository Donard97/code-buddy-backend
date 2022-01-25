class UserDetailsController < ApplicationController
  def index
    user = UserDetail.includes(:user).find(params[:user_id])
    render json: user, adapter: :json_api, status: 200
  end

  def show
    user_details = UserDetails.find(params[:user_id])
    render json: user_details, adapter: :json_api, status: 200
  end

  def create
    user_details = UserDetails.find(params[:user_id])
    render json: user_details, adapter: :json_api, status: 200 if user.save!
  end

  def update
    user_details = UserDetails.find(params[:user_id])
    render json: user_details, adapter: :json_api, status: 200 if user.update(user_params)
  end

  def destroy
    user_details = UserDetails.find(params[:user_id])
    user_details.destroy
    render json: user_details, adapter: :json_api, status: 200 if user.destroy!
  end
end
