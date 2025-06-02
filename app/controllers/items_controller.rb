class ItemsController < ApplicationController
  # ログインしている人だけがアクセスできる
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # 対象の商品を探して @item に入れる
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # 出品者でなければトップに飛ばす
  before_action :move_to_root_path, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path 
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipped_from_id,
                                 :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    # ログイン中でも出品者以外は弾く
    redirect_to root_path if current_user != @item.user
  end
end
