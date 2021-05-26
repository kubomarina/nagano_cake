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
    redirect_to customer_path(@customer.id)
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.is_active = "退会"
    @customer.save
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :telephone_number, :address, :email, :is_active)
  end
  end
