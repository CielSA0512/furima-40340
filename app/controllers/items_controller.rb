class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
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
    params.require(:item).permit(:item_name, :item_content, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
