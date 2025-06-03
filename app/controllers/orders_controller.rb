require 'payjp'
class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_invalid_access

  def index
    @order_address = OrderAddress.new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end

    puts order_params.inspect
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :shipped_from_id, :city, :house_number, :building_name, :telephone_number)
          .merge(user_id: current_user.id, item_id: @item.id, token: "dummy_token") # PAY.JP導入前のためダミー表記、実装時には params[:token] を受け取るように変更
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_invalid_access
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end
end
