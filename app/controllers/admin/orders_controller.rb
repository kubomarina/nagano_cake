class Admin::OrdersController < ApplicationController
  def show
     @order = Order.find(params[:id])

    @total_item_price = 0

    @order.order_details.each do |order_detail|
     @total_item_price += (order_detail.item.price*1.1 * order_detail.amount).round
    end

    @total_payment = (@total_item_price + 800).round

  end

  def update
  end

  layout 'admin'
end
