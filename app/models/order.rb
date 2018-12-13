class Order < ApplicationRecord

  belongs_to :buyer
  belongs_to :farmer
  has_many :order_products, dependent: :destroy

end
