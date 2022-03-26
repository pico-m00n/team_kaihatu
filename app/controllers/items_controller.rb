class ItemsController < ApplicationController

 def index
  @genres = Genre.all
  @items = Item.all.page(params[:page]).per(8)
  @items_all = Item.all
 end


 def show
  @item = Item.find(params[:id])
  @cart_item = Cart_Item.new
  @genres = Genre.all
 end

end
