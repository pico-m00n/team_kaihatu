class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details.all
  end

end
