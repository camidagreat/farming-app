json.extract! product, :id, :name, :type, :sku, :created_at, :updated_at
json.url product_url(product, format: :json)
