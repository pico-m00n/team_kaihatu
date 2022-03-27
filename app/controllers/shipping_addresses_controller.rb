class ShippingAddressesController < ApplicationController

  def index
    @shipping_address=ShippingAdress.new
    @shipping_addresses=current_customer.shipping_adresses
  end

  def create
    @shipping_address=ShippingAdress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
    redirect_to shipping_addresses_path
  end

  def edit
    @shipping_addresses=ShippingAdress.find(params[:id])
  end

  def destroy
     @shipping_address=ShippingAdress.find(params[:id])
     @shipping_address.destroy
     redirect_to shipping_addresses_path
  end

  def update
    @shipping_address=ShippingAdress.find(params[:id])
    @shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end

  private
  def shipping_address_params
    params.require(:shipping_adress).permit(:shipping_post_code, :shipping_adress, :shipping_name)
  end
end
