class Public::CartItemsController < ApplicationController
  def index
   
   
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end
  
  private
  
  def cart_items
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :created_at, :updated_at)
  end
end
