class ReservationsController < ApplicationController

	def index
		@reservation = Reservation.all
	end
	def create
		# @reservation = current_user.reservations.new(reservation_params)
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@reservation.listing_id = params[:listing_id]
		if @reservation.save
		redirect_to reservation_path(@reservation)

		end
	end

	def show

	end

	private
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :price, :total, :listing_id)
		end

end