class ChangePriceToBeIntegerInFarmerProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :farmer_products, :price, :integer
  end
end
