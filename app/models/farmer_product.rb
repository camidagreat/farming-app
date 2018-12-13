class FarmerProduct < ApplicationRecord
  belongs_to :product
  belongs_to :farmer
  has_many :order_products

  monetize :price_in_cents, as: "price"
end
