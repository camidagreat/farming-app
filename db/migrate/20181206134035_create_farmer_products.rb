class CreateFarmerProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :farmer_products do |t|
      t.integer :product_id
      t.integer :farmer_id
      t.string :size
      t.float :price

      t.timestamps
    end
  end
end
