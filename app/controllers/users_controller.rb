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
    user = User.create(user_name: params[:user_name])
    render json: user, adapter: :json_api, status: 200 if user.save!
  end

  def update
    user = User.find(params[:id])

    respond_to do |format|
      if user.update(user_name: params[:user_name])
        format.json {  render json: user, status: :ok, location: user }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "User has been deleted succesfully!", user_name: user.user_name}, adapter: :json_api, status: 200 if user.destroy!
  end
end
