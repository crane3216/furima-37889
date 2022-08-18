class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

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
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :sales_status_id, :schedule_delivery_id, :prefecture_id, :category_id,
                                 :shipping_fee_status_id, :image).merge(user_id: current_user.id)
  end
end
