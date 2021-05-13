class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end
    
  def edit 
    @address = Address.find(params[:id])
  end 
    
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to address_path(@address.id)
  end
  
  def update
    @Address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to address_path(@address.id)
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to address_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address, :created_at, :updated_at)
  end
end
