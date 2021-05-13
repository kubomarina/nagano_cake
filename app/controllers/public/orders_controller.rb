class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(params[:id])
  end

  def index
    @orders = Order.all
    @items = @customer.item
  end

  def show
    @order = Order.find(params[:id])
  end

  def comfirm
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:custoer_id, :postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment)
  end
end
