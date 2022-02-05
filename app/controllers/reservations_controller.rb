class ReservationsController < ApplicationController
  api :GET, '/users/:user_id/reservations', "This is index view for user's reservations"
  def index
    user = User.find(params[:user_id])
    reservations = user.reservations
    meetings = []
    reservations.each do |reserve|
      meeting = Meeting.find(reserve.meeting_id)
      meetings.push meeting
    end
    render json: meetings, adapter: :json_api, status: :ok
  end

  api :POST, '/users/:user_id/reservations', 'Create a new reservation for meeting'
  def create
    reservation = Reservation.create(user_id: params[:user_id], meeting_id: params[:meeting_id])
    render json: reservation, adapter: :json_api, status: :ok if reservation.save!
  end

  api :DELETE, '/users/:user_id/reservations/:id', 'Delete a reservation for a meeting'
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    render json: { message: 'Reservation has been deleted succesfully!', reservation: reservation.meeting.title },
           adapter: :json_api, status: :ok
  end
end
