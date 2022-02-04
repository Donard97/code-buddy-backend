class UsersController < ApplicationController
  api :GET, "/users", "This is the index view for all users"
  def index
    users = User.all
    render json: users, adapter: :json_api, status: 200
  end

  api :GET, "/users", "Gets the show page for a user"
  def show
    user = User.find(params[:id])
    render json: user, adapter: :json_api, status: 200
  end

  api :POST, "/users", "Creates a user"
  def create
    user = User.create(user_name: params[:user_name])
    render json: user, adapter: :json_api, status: 200 if user.save!
  end

  api :PUT, "/users/:id", " Update a user"
  def update
    user = User.find(params[:id])

    respond_to do |format|
      if user.update(user_name: params[:user_name])
        format.json { render json: user, status: :ok }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  api :DELETE, "/users/:id", "Delete a user"
  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: 'User has been deleted succesfully!', user_name: user.user_name }, adapter: :json_api,
           status: 200
  end
end
