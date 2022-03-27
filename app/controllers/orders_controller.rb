class OrdersController < ApplicationController
	before_action :authenticate_customer!


  def new
    @order = Order.new
		@customer = current_customer
		@addresses = ShippingAdress.where(customer_id: current_customer.id)
  end

  def create

   	  customer = current_customer
   	  session[:order] = Order.new
   	  cart_items = current_customer.cart_items
   	  sum = 0
   	  cart_items.each do |cart_item|
   	  	sum += ((cart_item.item.price).to_i * 1.1).floor * (cart_item.amount).to_i
   	  end

   	  session[:order][:shipping_cost] = 800
   	  session[:order][:total_payment] = sum + session[:order][:shipping_cost]
   	  session[:order][:order_status] = 0
   	  session[:order][:customer_id] = current_customer.id
   	  session[:order][:payment_method] = params[:method].to_i

   	  destination = params[:a_method].to_i

   	  if destination == 0
   	  	session[:order][:shipping_post_code] = customer.post_code
   	  	session[:order][:shipping_adress] = customer.address
   	  	session[:order][:shipping_name] = customer.name_family + customer.name_first
   	  # 登録済住所が選択された時
   	  elsif destination == 1
   	  	session[:order][:shipping_post_code] = shipping_addresses.shipping_post_code
   	  	session[:order][:shipping_adress] = shipping_addresses.shipping_addressadress
   	  	session[:order][:shipping_name] = shipping_addresses.shipping_name
   	  # 新しいお届け先が選択された時
   	  elsif destination == 2
   	  	session[:new_address] = 2
   	  	session[:order][:shipping_post_code] = params[:shipping_post_code]
   	  	session[:order][:shipping_adress] = params[:shipping_adress]
   	  	session[:order][:shipping_name] = params[:shipping_name]
   	  end

   	  redirect_to order_about_path
  end

	def about
		@cart_items = current_customer.cart_items
	end

  def complete
		order = Order.new(session[:order])
		order.save

		if session[:new_address]
			shipping_address = current_customer.shipping_addresses.new
			shipping_address.post_code = order.shipping_post_code
			shipping_address.shipping_address = order.shipping_adress
			shipping_address.shipping_name = order.shipping_name
			shipping_address.save
			session[:new_address] = nil
		end

		cart_items = current_customer.cart_items
		cart_items.each do |cart_item|
			order_detail = OrderDetail.new
			order_detail.order_id = order.id
			order_detail.item_id = cart_item.item.id
			order_detail.amount = cart_item.amount
			order_detail.item_status = 0
			order_detail.total_price = (cart_item.item.price * 1.1).floor
			order_detail.save
		end

		cart_items.destroy_all
  end

  def index
  end

  def show
  end
end
