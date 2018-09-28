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
		ReservationJob.perform_later(@reservation)
		redirect_to reservation_path(@reservation)

		end
	end

	def show
		@client_token = Braintree::ClientToken.generate
		@reservation = Reservation.find(params[:id])

	end

	def confirmation
	  
	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => "10.00", #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )
	  if result.success?
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end

	private
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :price, :total, :listing_id)
		end

end