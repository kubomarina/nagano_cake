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

    @order.order_details.each do |order_detail|
     @total_item_price += order_detail.item.price * order_detail.amount.to_i
    end

    @total_payment = @total_item_price*1.1 + 800.to_i
  end

  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items

    @total_item_price = 0

    @cart_items.each do |ci|
     @total_item_price += ci.item.price*1.1 * ci.amount.round
    end

    @total_payment = @total_item_price*1.1 + 800.round
    render :confirm
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
     @order_detail = OrderDetail.new()
     @order_detail.item_id = cart_item.item_id
     @order_detail.order_id = @order.id
     @order_detail.price = cart_item.item.price
     @order_detail.amount = cart_item.amount
     @order_detail.making_status = 0
     @order_detail.save!
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment)
  end
end
