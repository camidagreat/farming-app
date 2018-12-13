class Inventory < ApplicationRecord

  belongs_to :farm_location
  has_many :inventory_products

end
