require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    @purchase_record_address = FactoryBot.build(:purchase_record_address)
  end

  describe '商品購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_record_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase_record_address.building_name = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では保存できない' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @purchase_record_address.postal_code = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁ハイフン4桁」半角英数値でなければ保存できない' do
        @purchase_record_address.postal_code = 'aaaaaa４'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが0では保存できない' do
        @purchase_record_address.prefecture_id = 0
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @purchase_record_address.house_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数値でなければ保存できない' do
        @purchase_record_address.phone_number = '０901234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが9桁では保存できない' do
        @purchase_record_address.phone_number = '090123456'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが12桁では保存できない' do
        @purchase_record_address.phone_number = '090123456789'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'item_idが紐づいていなければ保存できない' do
        @purchase_record_address.item_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが紐づいていなければ保存できない' do
        @purchase_record_address.user_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
