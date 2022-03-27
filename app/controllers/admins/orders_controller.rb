class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details.all
    @items_total_price = calculate(@order)
  end

  def calculate(items_total_price)
    @items_total_price = 0
    @order_details.each {|order_detail|
    tax_in_price = (order_detail.item.price * 1.1).floor
    sub_total_price = tax_in_price * order_detail.amount
    @items_total_price += sub_total_price
    }
    return @items_total_price
  end

  def order_status_update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end

  def item_status_update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(order_detail.order_id)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_status)
  end

end
