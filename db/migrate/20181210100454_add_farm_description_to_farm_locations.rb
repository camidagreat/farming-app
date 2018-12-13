class AddFarmDescriptionToFarmLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :farm_locations, :farm_description, :string
  end
end
