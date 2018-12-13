class OrderProduct < ApplicationRecord

    belongs_to :order
    belongs_to :farmer_product
    
end
