class OrdersController < ApplicationController
  def index
    @order_item = Item.find(params[:item_id])
  end
end
