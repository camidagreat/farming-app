class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :farm_location_id
      t.datetime :finish_time
      t.datetime :start_time

      t.timestamps
    end
  end
end
