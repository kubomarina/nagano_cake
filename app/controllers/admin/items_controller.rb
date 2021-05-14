class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.genre_id = item_params[:genre_id].to_i
    if @item.save
    redirect_to admin_item_path(@item.id)
    else
      @items = Item.all
      render :index
    end
  end


  def index
    @items = Item.page(params[:page]).reverse_order
    @item = Item.new
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path
  end

layout 'admin'
private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
  end
end
