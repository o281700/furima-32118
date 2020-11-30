require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '購入者情報が保存できるとき' do
      it '全ての情報(token含む)が入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
    end
    context '購入者情報が保存できないとき' do
      it '郵便番号が空白のとき' do
        @order_form.postal = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal can't be blank")
      end
      it '郵便番号に"-"が入っていないとき' do
        @order_form.postal = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal Input correctly')
      end
      it '都道府県を選択していないとき' do
        @order_form.area_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Area Select')
      end
      it '市区町村が空白のとき' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空白のとき' do
        @order_form.add = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Add can't be blank")
      end
      it '電話番号が空白のとき' do
        @order_form.tel = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号に"-"が入っているとき' do
        @order_form.tel = '090-1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel Input only number')
      end
      it 'tokenが空のとき' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
