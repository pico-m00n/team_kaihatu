class CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_customer.update(customer_params)
    redirect_to customers_path
  end

  def out
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_customer_registration_path
  end

 

  private
  def customer_params
    params.require(:customer).permit(:name_family, :name_first, :name_kana_family, :name_kana_first, :post_code, :address, :phone_number, :is_deleted)
  end
end