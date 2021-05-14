class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
  　@customer = Customer.find(current_customer.id)
  　@customer.update(is_active: false)
  　reset_session
  　redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :telephone_number, :address, :email)
  end
end
