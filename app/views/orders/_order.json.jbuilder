json.extract! order, :id, :location_id, :pick_up_lat, :pick_up_lng, :pick_up_location_name, :farmer_id, :buyer_id, :has_been_picked_up, :created_at, :updated_at
json.url order_url(order, format: :json)
