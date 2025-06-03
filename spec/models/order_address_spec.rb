require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    sleep(0.1)
    item = FactoryBot.create(:item)
    sleep(0.1)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が全角だと保存できない' do
        @order_address.post_code = '１２３-４５６７'  # 全角数字
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Enter it as 3 digits hyphen 4 digits (e.g. 123-4567)')
      end

      it '郵便番号にハイフンがないと保存できない' do
        @order_address.post_code = '1234567'  # ハイフンなし
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Enter it as 3 digits hyphen 4 digits (e.g. 123-4567)')
      end

      it '都道府県が---だと保存できない' do
        @order_address.shipped_from_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipped from can't be blank")
      end

      it '市区町村が空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が9桁以下では保存できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Enter 10 or 11 digits without hyphens")
      end

      it '電話番号が12桁以上では保存できない' do
        @order_address.telephone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Enter 10 or 11 digits without hyphens")
      end

      it '電話番号にハイフンが含まれていると保存できない' do
        @order_address.telephone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Enter 10 or 11 digits without hyphens")
      end

      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
