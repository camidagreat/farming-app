class AddFarmerDescriptionToFarmers < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :farmer_description, :string
  end
end
