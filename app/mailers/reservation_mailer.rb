class ReservationMailer < ApplicationMailer

	def reservation_email(reservation)
    @customer = reservation.user
    @host = reservation.listing.user
    @listing = reservation.listing

    mail(to: "ash39136@gmail.com", subject: "You're going to #{@listing.city}!")
  end
end
