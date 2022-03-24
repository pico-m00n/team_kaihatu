class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    #@order = Order.find(params[:id])
    #@custoer = @order.customer
    #@order_detail = @order.item
    #@order_details = @order_detail.all
  end
end
