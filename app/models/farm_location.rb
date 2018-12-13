class FarmLocation < ApplicationRecord
  has_many :inventories
  belongs_to :farmer
  has_many :orders, through: :farmer

  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :location_lat,
                   :lng_column_name => :location_lng
end
