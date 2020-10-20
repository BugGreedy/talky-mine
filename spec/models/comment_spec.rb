require 'rails_helper'
require 'faker'
Faker::Config.locale = :ja
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it '入力欄に正しく記入できていれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'ユーザ-が紐付いてないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end

      it '音源が紐付いてないと投稿できない' do
        @comment.sound = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Sound must exist')
      end

      it 'コメントが空では投稿できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
