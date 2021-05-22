class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items
    
    @total_item_price = 0

    @cart_items.each do |cart_item|
     @total_item_price += cart_items.item.price * cart_items.amount.to_i
    end

    @total_payment = @total_item_price*1.1 + 800.to_i
  end

  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items

    @total_item_price = 0

    @cart_items.each do |ci|
     @total_item_price += ci.item.price * ci.amount.to_i
    end

    @total_payment = @total_item_price*1.1 + 800.to_i
    render :confirm
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:custoer_id, :postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment)
  end
end
