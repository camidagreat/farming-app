class CreateFarmLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :farm_locations do |t|
      t.string :name
      t.string :location_address
      t.float :location_lat
      t.float :location_lng
      t.datetime :open_time
      t.datetime :close_time
      t.string :phone_number
      t.string :email
      t.integer :farmer_id

      t.timestamps
    end
  end
end
