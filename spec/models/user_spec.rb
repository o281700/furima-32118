require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての値が正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_kanaが空では登録できないこと' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'first_kanaが空では登録できないこと' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailでは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていない場合は登録できないこと' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'zaq12'
        @user.password_confirmation = 'zaq12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数混合していない場合は登録しないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'last_nameは全角(漢字、ひらがな、カタカナ)でないと登録できないこと' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'first_nameは全角(漢字、ひらがな、カタカナ)でないと登録できないこと' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'last_kanaは全角(カタカナ)でないと登録できないこと' do
        @user.last_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana Full-width katakana characters')
      end
      it 'first_kanaは全角(カタカナ)でないと登録できないこと' do
        @user.first_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana Full-width katakana characters')
      end
    end
  end
end
