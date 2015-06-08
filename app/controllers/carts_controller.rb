class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.jso
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    user_id = params[:cart][:user_id]
    title = params[:cart][:title]
    @cart= Cart.find_by_user_id_and_title user_id, title

    if @cart.present?
      @cart.quantity =@cart.quantity + 1
    else
      @cart = Cart.new(cart_params)
    end
    respond_to do |format|
      if @cart.save
        format.html { redirect_to viewcarts_url, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def cartitems
    #@items=Cart.find_by(user_id:session[:user_id])
    @items = Cart.where(user_id:session[:user_id])
    @classcount = @items.count
    #多数量总价计算
    @value = @items.map {|c|
      c.quantity * c.price
    }.sum
    
    @order_information = Array.new
    #把关系数据库书名转换成数组
    @items.each{|x|
     @order_information.push({:title=>x.title,:quantity=>x.quantity})}
     #把这个数组转换成json好传递
     @information=JSON.generate(@order_information)




     #for b in a
     #@id=@cart.user_id  
     #viewcarts_url
  end

  def checkoutcart
    @items = Cart.where(user_id:session[:user_id])
    @items.destroy_all
    respond_to do |format|
      format.html { redirect_to viewcarts_url, notice: 'Cart was successfully clear.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:title, :quantity, :price,:user_id)
    end
end
