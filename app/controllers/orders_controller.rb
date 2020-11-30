class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @order_item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    return redirect_to root_path if @order_item.user.id == current_user.id
  end

  def create
    @order_form = OrderForm.new(info_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      redirect_to item_orders_path, flash: { error: @order_form.errors.full_messages }
    end
  end

  private

  def info_params
    params.require(:order_form).permit(
      :postal, :area_id, :city, :add, :bldg, :tel, :order_id
    ).merge(
      user_id: current_user.id, item_id: params[:item_id],
      token: params[:token], price: Item.find(params[:item_id]).price
      )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: info_params[:price],
      card: info_params[:token],
      currency: 'jpy'
    )
  end
end
