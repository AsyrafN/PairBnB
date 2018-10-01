class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|

      t.string :place_type
      t.string :property_type
      t.string :guest_number
      t.string :bedroom_number
      t.string :bed_number
      t.string :bathroom_number      
      t.string :country
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :price
      t.string :description         
      t.belongs_to :user

      t.timestamps
    end
  end
end
