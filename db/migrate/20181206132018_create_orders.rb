class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :location_id
      t.float :pick_up_lat
      t.float :pick_up_lng
      t.string :pick_up_location_name
      t.integer :farmer_id
      t.integer :buyer_id
      t.boolean :has_been_picked_up

      t.timestamps
    end
  end
end
