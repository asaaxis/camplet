require 'rails_helper'

RSpec.describe 'ユーザモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '名前とメールとパスワードがある' do
      it 'アカウントが新規で作成される' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, name: '')
        expect(user).not_to be_valid
      end
    end
    context 'メールが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, email: '')
        expect(user).not_to be_valid
      end
    end
    context 'メールの形式が異なる場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, email: 'email.com')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, password: '')
        expect(user).not_to be_valid
      end
    end
  end
end
# bundle exec rspec spec/models/user_spec.rb