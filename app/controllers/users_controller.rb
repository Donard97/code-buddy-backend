class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, adapter: :json_api, status: 200
  end

  def show
    user = User.find(params[:id])
    render json: user, adapter: :json_api, status: 200
  end

  def create
    user = User.find(params[:id])
    render json: user, adapter: :json_api, status: 200 if user.save!
  end

  def update
    user = User.find(params[:id])
    render json: user, adapter: :json_api, status: 200 if user.update(user_params)
  end

  def destroy
    user = User.find(params[:id])
    @user.destroy
    render json: user, adapter: :json_api, status: 200 if user.destroy!
  end

  private

  def record_not_found
    render json: { message: 'Record Not Found!'}, adapter: :json_api, status: 404
  end
end
