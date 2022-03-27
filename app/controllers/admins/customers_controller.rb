class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
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
    redirect_to admins_customer_path(@customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana_name, :first_kana_name, :post_code, :address, :phone_number, :email, :is_deleted)
  end
end
