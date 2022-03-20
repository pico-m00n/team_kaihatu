class CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_customer.update
    redirect_to customers_path
  end
end
