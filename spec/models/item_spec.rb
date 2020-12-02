require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての値が正しく存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'カテゴリーを選択していないと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category status Select')
      end
      it '商品状態を選択していないと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status status Select')
      end
      it '配送料の負担を選択していないと登録できない' do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee status Select')
      end
      it '発送元地域を選択していないと登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area status Select')
      end
      it '発送日数を選択していないと登録できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day status Select')
      end
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角だと登録できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '価格が範囲内(300~9,999,999)でないと登録できない' do
        @item.price = '12345678'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
