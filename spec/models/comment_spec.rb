require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    it 'コメントが入力されていれば保存できる' do
      expect(@comment).to be_valid
    end

    it 'コメントが空の時は保存できないこと' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end

    it 'ユーザーが紐づいていなければ保存できないこと' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("User must exist")
    end

    it '商品が紐づいていなければ保存できない' do
      @comment.item = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Item must exist")
    end
  end
end
