class Listing < ApplicationRecord
	include PgSearch
	pg_search_scope :search_by_city, :against => :city
	

	belongs_to :user
	has_many :avatars
	has_many :reservations

    

	def self.place_type
		['Apartment', 'House', 'Secondary Unit', 'Unique Space', 'Bed And Breakfast', 'Boutique Hotel']

	end

	def self.apartment

		['Apartment', 'Condominium', 'Casa particular', 'Loft', 'Serviced apartment']

	end

	def self.house

		['House', 'Bungalow', 'Cabin', 'Casa particular (Cuba)', 'Chalet', 
						 				 'Cottage', 'Cycladic house (Greece)', 'Dammuso (Italy)', 'Dome house',
										 'Earth house', 'Farm stay', 'Houseboat', 'Hut', 'Lighthouse', 'Townhouse',
										 'Villa']

	end

	def self.secondary_unit

		['Guesthouse', 'guest_suite', 'farm_stay']

	end

	def self.unique_space

		['Guesthouse', 'guest_suite', 'farm_stay']

	end

	def self.bed_and_breakfast

		['Guesthouse', 'guest_suite', 'farm_stay']

	end

	def self.boutique_hotel

		['Guesthouse', 'guest_suite', 'farm_stay']

	end

	def self.property_type
		{
			"Apartment": 	   	 ['Apartment', 'Condominium', 'Casa particular', 'Loft', 'Serviced apartment'],
			"House": 	 		 ['House', 'Bungalow', 'Cabin', 'Casa particular (Cuba)', 'Chalet', 
				 				 'Cottage', 'Cycladic house (Greece)', 'Dammuso (Italy)', 'Dome house',
								 'Earth house', 'Farm stay', 'Houseboat', 'Hut', 'Lighthouse', 'Townhouse',
								 'Villa'],
			"Secondary unit":    ['Guesthouse', 'guest_suite', 'farm_stay'],
			"Unique space":      ['Guesthouse', 'guest_suite', 'farm_stay'],
			"Bed and breakfast": ['Guesthouse', 'guest_suite', 'farm_stay'],
			"Boutique hotel":    ['Guesthouse', 'guest_suite', 'farm_stay'],
						} 
		
	end

	def self.guest_number
		(1..30)
	end

	def self.bedroom_number
		(1..20)
	end

	def self.bed_number
		(1..30)
	end

	def self.bathroom_number
		(1..15)
	end

	def self.country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
    end

    def address
    end

    

	# def self.apartment
	# 	['Apartment', 'Condominium', 'Casa particular', 'Loft', 'Serviced apartment']
	# end

	# def self.house
	# 	['House', 'Bungalow', 'Cabin', 'Casa particular (Cuba)', 'Chalet', 
	# 	 'Cottage', 'Cycladic house (Greece)', 'Dammuso (Italy)', 'Dome house',
	# 	 'Earth house', 'Farm stay', 'Houseboat', 'Hut', 'Lighthouse', 'Townhouse',
	# 	 'Villa']
	# end

	

end




