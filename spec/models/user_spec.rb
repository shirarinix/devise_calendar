require 'rails_helper'

RSpec.describe User, type: :model do
  before 'ユーザー管理機能' do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,birthday,sex,email,password,password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが必須である' do
        @user.nickname = 'abcd'
        expect(@user).to be_valid
      end
      it '生年月日が必須である' do
        @user.birthday = '1984-09-09'
        expect(@user).to be_valid
      end
      it 'sex(性別)が必須である' do
        @user.sex = 'man'
        expect(@user).to be_valid
      end
      it 'メールアドレスに@が必ず含まれている' do
        @user.email = 'shirarin@gmail.com '
        expect(@user).to be_valid
      end
      it 'password入力には6文字以上が必須である' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'password入力にはが半角英数字の混合が必須である' do
        @user.password = 'a1b2c3'
        @user.password_confirmation = 'a1b2c3'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録ができない' do
        @user.nickname = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthdayが空だと登録ができない' do
        @user.birthday = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'sex(性別)が空だと登録ができない' do
        @user.sex = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Sex can't be blank")
      end
      it 'emailが空だと登録ができない' do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すると登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録ができない' do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録ができない' do
        @user.password = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録ができない' do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
