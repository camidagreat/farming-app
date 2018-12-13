class FarmerProductsController < ApplicationController
  before_action :set_farmer_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_farmer!

  # GET /farmer_products
  # GET /farmer_products.json
  def index
    if farmer_signed_in?
      @farmer_products = FarmerProduct.where(farmer_id: current_farmer.id)
    end
  end

  # GET /farmer_products/1
  # GET /farmer_products/1.json
  def show
  end

  # GET /farmer_products/new
  def new
    @farmer_product = FarmerProduct.new
    @sizes = [["Pound", "Pound"],
              ["Ounce", "Ounce"],
              ["Piece", "Piece"],
              ["Head", "Head"],
              ["Bushel", "Bushel"],
              ["Kg", "Kg"],
              ["Carton", "Carton"],
              ["Ear", "Ear"],
              ["Bunch", "Bunch"],
              ["Handful", "Handful"],
              ["Inches", "Inches"],
             ]
    @products = []
    for product in Product.all do
      product_name = product.variety.to_s + " " + product.name.to_s
      @products.push([product_name, product.id])
    end
  end

  # GET /farmer_products/1/edit
  def edit
    @sizes = [["Pound", "Pound"],
              ["Ounce", "Ounce"],
              ["Piece", "Piece"],
              ["Head", "Head"],
              ["Bushel", "Bushel"],
              ["Kg", "Kg"],
              ["Carton", "Carton"],
              ["Ear", "Ear"],
              ["Bunch", "Bunch"],
              ["Handful", "Handful"],
              ["Inches", "Inches"],
             ]
    @products = []
    for product in Product.all do
      product_name = product.variety.to_s + " " + product.name.to_s
      @products.push([product_name, product.id])
    end
  end

  # POST /farmer_products
  # POST /farmer_products.json
  def create
    if farmer_product_params[:price].include? "$"
      no_dollar_sign = farmer_product_params[:price].delete("$")
      farmer_product_params[:price] = no_dollar_sign
    end

    @farmer_product = FarmerProduct.new(farmer_product_params)

    respond_to do |format|
      if @farmer_product.save
        format.html { redirect_to @farmer_product, notice: 'Farmer product was successfully created.' }
        format.json { render :show, status: :created, location: @farmer_product }
      else
        format.html { render :new }
        format.json { render json: @farmer_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farmer_products/1
  # PATCH/PUT /farmer_products/1.json
  def update
    respond_to do |format|
      if @farmer_product.update(farmer_product_params)
        format.html { redirect_to @farmer_product, notice: 'Farmer product was successfully updated.' }
        format.json { render :show, status: :ok, location: @farmer_product }
      else
        format.html { render :edit }
        format.json { render json: @farmer_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmer_products/1
  # DELETE /farmer_products/1.json
  def destroy
    @farmer_product.destroy
    respond_to do |format|
      format.html { redirect_to farmer_products_url, notice: 'Farmer product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmer_product
      @farmer_product = FarmerProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmer_product_params
      params.require(:farmer_product).permit(:product_id, :farmer_id, :size, :price, :amount)
    end
end
