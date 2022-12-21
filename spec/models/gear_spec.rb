require 'rails_helper'

RSpec.describe 'キャンプギアモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'バリデーションのテスト' do
    context '名前、数量を1以上入力した場合' do
      it 'バリデーションが通る' do
        gear = FactoryBot.build(:gear, user: user)
        expect(gear).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションにひっかかる' do
        gear = FactoryBot.build(:gear, name: "", user: user)
        expect(gear).to be_invalid
      end
    end
    context '数量が0以下の場合' do
      it 'バリデーションにひっかかる' do
        gear = FactoryBot.build(:gear, quantity: "0", user: user)
        expect(gear).to be_invalid
      end
    end
  end
end
# bundle exec rspec spec/models/gear_spec.rb