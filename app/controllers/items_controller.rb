class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  # def destroy
  #   @item.destroy
  #   redirect_to root_path
  # end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :sales_status_id, :schedule_delivery_id, :prefecture_id, :category_id,
                                 :shipping_fee_status_id, :image).merge(user_id: current_user.id)
  end
end
