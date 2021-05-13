class Public::CartItemsController < ApplicationController
  def index
    @cart_item = Cart_item.new 
    @item = Item.find(params[:item_id])
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  def create
    @cart_item = Cart_item.new(item_params)
    @item = Item.find(params[:item_id])
    @cart_item.save
    
  end
  
  private
  
  def cart_items
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :created_at, :updated_at)
  end
end
