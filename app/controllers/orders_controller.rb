class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def checkorder
    @a=Order.where(user_id:session[:user_id]) 

  end
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @a=@order.information
    @b=JSON.parse(@a)
    @items = Cart.where(user_id:session[:user_id])
    @items.destroy_all
  end

  # GET /orders/new
  def new
    @order = Order.new
    @information1=params[:information]
    @total_price=params[:total_price]
    @user_id=params[:user_id]
    @information=JSON.parse(@information1)

  end
  # GET /orders/1/edit
  def edit
  end
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        @information1 = params[:order][:information]
        @total_price = params[:order][:total_price]
        @user_id = params[:order][:user_id]
        @information = JSON.parse(@information1)

        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
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
      params.require(:order).permit(:information, :total_price, :phonenumber, :address, :user_id)
    end
end
