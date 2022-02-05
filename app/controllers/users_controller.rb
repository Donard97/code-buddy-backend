class UsersController < ApplicationController
  api :GET, '/users', 'This is the index view for all users'
  def index
    users = User.all
    render json: users, adapter: :json_api, status: :ok
  end

  def login_register
    user_name = params[:user_name]
    if User.where(user_name: user_name).exists?
      # login
      user = User.find_by(user_name: user_name)
      render json: user, adapter: :json_api, status: :ok if user
    else
      # create new user
      user = User.create(user_name: user_name)
      render json: user, adapter: :json_api, status: :created if user.save!
    end
  end

  api :GET, '/users', 'Gets the show page for a user'
  def show
    user = User.find(params[:id])
    render json: user, adapter: :json_api, status: :ok
  end

  api :POST, '/users', 'Creates a user'
  def create
    user = User.create(user_name: params[:user_name])
    render json: user, adapter: :json_api, status: :created if user.save!
  end

  api :PUT, '/users/:id', ' Update a user'
  def update
    user = User.find(params[:id])

    respond_to do |format|
      if user.update(user_name: params[:user_name])
        format.json { render json: user, status: :ok }
      else
        format.json { render json: format_error('Unprocessable entity', user.errors), status: :unprocessable_entity }
      end
    end
  end

  api :DELETE, '/users/:id', 'Delete a user'
  def destroy
    user = User.find(params[:id])
    render json: { message: 'User has been deleted succesfully!', user_name: user.user_name }, adapter: :json_api, status: :ok if user.destroy!
  end
end
