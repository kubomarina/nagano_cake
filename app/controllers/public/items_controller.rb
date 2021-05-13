class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    redirect_to public_cart_items_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :created_at, :updated_at, :genre)
  end
end
