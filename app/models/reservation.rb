class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validates :start_date, presence: true
	validates :end_date, presence: true
	validate :check_dates

	def check_dates
		if (Reservation.where("(? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date) AND listing_id = ?", self.start_date, self.end_date, self.listing_id).any?)
     		errors.add(:end_date, 'it overlaps another reservation')
  		end
	end

	def price
		listing_price = Listing.find(self.listing_id).price
	end

	def total_price
		self.total_price = (self.end_date - self.start_date) * listing_price
	end
end

	# errors.add(:date, "and time is not available") unless Reservation.where("? = date AND time BETWEEN ? AND ?", date, time - 4.hours, time + 4.hours).count == 0