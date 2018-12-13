class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if farmer_signed_in?
      @orders = current_farmer.orders
    elsif buyer_signed_in?
      @orders = current_buyer.orders
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @total_cost = 0
    for product in @order.order_products do
      @line_item_cost = product.farmer_product.price * product.amount
      @total_cost += @line_item_cost
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    if params[:farmer_id]
      @farmer = Farmer.find(params[:farmer_id])
      @farmer_products = @farmer.farmer_products
    else
      redirect_to '/buyer_app/farms'
    end
  end

  # GET /orders/1/edit
  def edit
    @farmer = @order.farmer
    @farmer_products = @farmer.farmer_products
    @order_products = @order.order_products
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @farmer_products = Farmer.find(order_params[:farmer_id]).farmer_products

    respond_to do |format|
      if @order.save

        for product in @farmer_products do
          if params[:order]["#{product.id}"].to_i > 0
            OrderProduct.create(farmer_product_id: product.id, order_id: @order.id, amount: params[:order]["#{product.id}"].to_i)
          end
        end

        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @farmer_products = @order.farmer.farmer_products
    @old_order_products = @order.order_products
    respond_to do |format|
      if @order.update(order_params)

        for product in @farmer_products do
          @old_order_product = @old_order_products.where(farmer_product_id: product.id).first || OrderProduct.new

          if params[:order]["#{product.id}"].to_i == 0
            @old_order_product.destroy
          elsif params[:order]["#{product.id}"].to_i != 0 && params[:order]["#{product.id}"].to_i != @old_order_product.amount
            @old_order_product.update(farmer_product_id: product.id, order_id: @order.id, amount: params[:order]["#{product.id}"].to_i)
          end
        end

        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:location_id, :pick_up_lat, :pick_up_lng, :pick_up_location_name, :farmer_id, :buyer_id, :has_been_picked_up, :ordered_products, 1..10000000)
    end
end
