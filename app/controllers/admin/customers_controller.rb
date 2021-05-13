class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all

  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path(@customer.id)
  end

  layout 'admin'

  private

  def customer_prams
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :telephone_number, :address, :email)
  end
end
