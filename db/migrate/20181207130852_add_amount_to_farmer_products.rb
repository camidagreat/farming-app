class AddAmountToFarmerProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :farmer_products, :amount, :float
  end
end
