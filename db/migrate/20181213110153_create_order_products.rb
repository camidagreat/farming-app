class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :farmer_product_id
      t.float :amount

      t.timestamps
    end
  end
end
