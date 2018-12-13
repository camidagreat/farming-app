class Buyers::BuyersController < ApplicationController
  before_action :authenticate_buyer!
  def index_farms
    if current_buyer.home_lat == nil
      redirect_to "/buyer_app/buyer_location"
    end
    @farm_locations = FarmLocation.within(50, :origin => [current_buyer.home_lat, current_buyer.home_lng])
    if @farm_locations.count == 0
      @farm_locations = FarmLocation.all
      flash[:notice] = "Looks like there aren't any farms close to you"
    end
  end

  def show_farmer
    @farmer = Farmer.find(params[:id])
    @products = @farmer.farmer_products
  end

  def place_order
    @farmer = Farmer.find(params[:farmer_id])
  end

  def buyer_location
    @buyer_location = current_buyer.home_location
    @buyer_lat = current_buyer.home_lat
    @buyer_lng = current_buyer.home_lng
  end

  def set_buyer_location
    current_buyer.update(home_lat: params[:home_lat], home_lng: params[:home_lng], home_location: params[:home_location])

    respond_to do |format|
      format.html { redirect_to '/buyer_app/farms', notice: 'Location saved!' }
      format.json { head :no_content }
    end
  end

end
