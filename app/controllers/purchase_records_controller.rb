class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user_item!
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    @item = Item.find(params[:item_id])
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_record_params
    params.require(:purchase_record_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_record_params[:token],
        currency: 'jpy'
      )
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_content, :category_id, :status_id, :delivery_charge_id,
                                 :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.purchase_record.present?
      redirect_to root_path
    end
  end

  def authenticate_user_item!
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
