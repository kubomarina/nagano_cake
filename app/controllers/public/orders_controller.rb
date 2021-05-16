class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
    @items = customer.item
  end

  def show
    @order = Order.find(params[:id])
  end

  def comfirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_comfirm_path
  end

  private

  def order_params
    params.require(:order).permit(:custoer_id, :postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment)
  end
end
