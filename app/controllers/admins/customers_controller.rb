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
    params.require(:customer).permit(:name_family, :name_first, :name_kana_family, :name_kana_first, :post_code, :address, :phone_number, :email, :is_deleted)
  end
end
