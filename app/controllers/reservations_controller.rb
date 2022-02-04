class ReservationsController < ApplicationController
  api :GET, '/users/:user_id/reservations', "This is index view for user's reservations"
  def index
    reservations = User.find(params[:user_id]).reservations
    render json: reservations, adapter: :json_api, status: 200
  end

  api :POST, '/users/:user_id/reservations', 'Create a new reservation for meeting'
  def create
    reservation = Reservation.create(user_id: params[:user_id], meeting_id: params[:meeting_id])
    render json: reservation, adapter: :json_api, status: 200 if reservation.save!
  end

  api :DELETE, '/users/:user_id/reservations/:id', 'Delete a reservation for a meeting'
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    render json: { message: 'Reservation has been deleted succesfully!', reservation: reservation.meeting.title },
           adapter: :json_api, status: 200
  end
end
