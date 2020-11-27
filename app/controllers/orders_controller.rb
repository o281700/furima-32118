class OrdersController < ApplicationController
  def index
    @order_item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(info_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      redirect_to item_orders_path, flash: { error: @order_form.errors.full_messages }
    end
  end

  private

  def info_params
    params.require(:order_form).permit(
      :postal, :area_id, :city, :add, :bldg, :tel, :order_id, :user_id, :item_id
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
