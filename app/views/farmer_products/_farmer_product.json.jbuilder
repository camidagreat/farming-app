json.extract! farmer_product, :id, :product_id, :farmer_id, :size, :price, :created_at, :updated_at
json.url farmer_product_url(farmer_product, format: :json)
