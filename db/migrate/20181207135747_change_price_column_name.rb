class ChangePriceColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :farmer_products, :price, :price_in_cents
  end
end
