class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
  end
  
  def update
  end
  
  layout 'admin'
end
