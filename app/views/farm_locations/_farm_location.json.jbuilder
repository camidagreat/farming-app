json.extract! farm_location, :id, :name, :location_address, :location_lat, :location_lng, :open_time, :close_time, :phone_number, :email, :farmer_id, :created_at, :updated_at
json.url farm_location_url(farm_location, format: :json)
