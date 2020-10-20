require 'rails_helper'
require 'faker'
Faker::Config.locale = :ja
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Sound, type: :model do
  before do
    @sound = FactoryBot.build(:sound)
    @sound.file = fixture_file_upload('spec/testaudios/test_audio.mp3')
  end

  describe 'サウンド投稿' do
    context '投稿がうまくいくとき' do
      it '入力欄に正しく記入できていれば投稿できる' do
        expect(@sound).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '投稿音源がないと登録できない' do
        @sound.file = nil
        @sound.valid?
        expect(@sound.errors.full_messages).to include
      end

      it 'ユーザ-が紐付いてないと登録できない' do
        @sound.user = nil
        @sound.valid?
        expect(@sound.errors.full_messages).to include('User must exist')
      end

      it 'タイトルがないと登録できない' do
        @sound.title = nil
        @sound.valid?
        expect(@sound.errors.full_messages).to include("Title can't be blank")
      end

      it '説明がないと登録できない' do
        @sound.text = nil
        @sound.valid?
        expect(@sound.errors.full_messages).to include("Text can't be blank")
      end

      it 'ジャンルを選択しないと登録できない' do
        @sound.genre_id = '0'
        @sound.valid?
        expect(@sound.errors.full_messages).to include('Genre は選択しないと投稿できません')
      end
    end
  end
end
