class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @item = Item.update(item_params)
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_content, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
