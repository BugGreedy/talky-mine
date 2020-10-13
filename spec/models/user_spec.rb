require 'rails_helper'
require "faker"
Faker::Config.locale = :ja

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('spec/testimages/image_test01.png')
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '入力欄に正しく記入できていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ユーザー画像がないと登録できない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end
        
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'emailが他のユーザーと同じものは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
  
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'a.a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
  
      it 'パスワードが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = Faker::Internet.password(max_length: 5)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
  
      it 'パスワードは半角英数でないと登録できない' do
        @user.password = Faker::Lorem.sentence
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
    end
  end
end