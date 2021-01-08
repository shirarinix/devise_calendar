require 'rails_helper'

RSpec.describe Artist, type: :model do
  before 'アーティスト管理機能' do
    @artist = FactoryBot.build(:artist)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録がうまくいくとき' do
      it 'artistname,birthday,sex,email,password,password_confirmationが存在すれば登録できる' do
        expect(@artist).to be_valid
      end
      it 'artistnameが必須である' do
        @artist.artistname = 'abcd'
        expect(@artist).to be_valid
      end
      it '生年月日が必須である' do
        @artist.birthday = '1984-09-09'
        expect(@artist).to be_valid
      end
      it 'sex(性別)が必須である' do
        @artist.sex = 'woman'
        expect(@artist).to be_valid
      end
      it 'メールアドレスに@が必ず含まれている' do
        # binding.pry
        @artist.email = 'kanarin@gmail.com'
        expect(@artist).to be_valid
      end
      it 'password入力には6文字以上が必須である' do
        @artist.password = 'abc123'
        @artist.password_confirmation = 'abc123'
        expect(@artist).to be_valid
      end
      it 'password入力にはが半角英数字の混合が必須である' do
        @artist.password = 'a1b2c3'
        @artist.password_confirmation = 'a1b2c3'
        expect(@artist).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'artistnameが空だと登録ができない' do
        @artist.artistname = ' '
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Artistname can't be blank")
      end
      it 'birthdayが空だと登録ができない' do
        @artist.birthday = ' '
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'sex(性別)が空だと登録ができない' do
        @artist.sex = ' '
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Sex can't be blank")
      end
      it 'emailが空だと登録ができない' do
        # binding.pry
        @artist.email = ' '
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すると登録ができない' do
        @artist.save
        another_artist = FactoryBot.build(:artist, email: @artist.email)
        another_artist.valid?
        expect(another_artist.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録ができない' do
        @artist.password = ' '
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録ができない' do
        @artist.password = 'ab123'
        @artist.valid?
        expect(@artist.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録ができない' do
        @artist.password_confirmation = ' '
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
