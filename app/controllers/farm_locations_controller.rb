class FarmLocationsController < ApplicationController
  before_action :set_farm_location, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_farmer!

  # GET /farm_locations
  # GET /farm_locations.json
  def index
      @farm_locations = current_farmer.farm_locations
  end

  # GET /farm_locations/1
  # GET /farm_locations/1.json
  def show
  end

  def location_search
  end

  # GET /farm_locations/new
  def new
    @farm_location = FarmLocation.new

    client = GooglePlaces::Client.new("AIzaSyDl9Xvml9nUYzG62Bbnxo9OA5EcD-wfQMA")
    query_string = params[:location_search]

    @place_options = client.spots_by_query(query_string)
  end

  # GET /farm_locations/1/edit
  def edit
  end

  # POST /farm_locations
  # POST /farm_locations.json
  def create
    @farm_location = FarmLocation.new(farm_location_params)

    respond_to do |format|
      if @farm_location.save
        format.html { redirect_to @farm_location, notice: 'Farm location was successfully created.' }
        format.json { render :show, status: :created, location: @farm_location }
      else
        format.html { render :new }
        format.json { render json: @farm_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farm_locations/1
  # PATCH/PUT /farm_locations/1.json
  def update
    respond_to do |format|
      if @farm_location.update(farm_location_params)
        format.html { redirect_to @farm_location, notice: 'Farm location was successfully updated.' }
        format.json { render :show, status: :ok, location: @farm_location }
      else
        format.html { render :edit }
        format.json { render json: @farm_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farm_locations/1
  # DELETE /farm_locations/1.json
  def destroy
    @farm_location.destroy
    respond_to do |format|
      format.html { redirect_to farm_locations_url, notice: 'Farm location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_location
      @farm_location = FarmLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farm_location_params
      params.require(:farm_location).permit(:name, :location_address, :location_lat, :location_lng, :open_time, :close_time, :phone_number, :email, :farmer_id)
    end
end
