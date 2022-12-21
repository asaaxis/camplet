require 'rails_helper'

RSpec.describe 'チャットモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:second_user) }
  let!(:travel_plan) { FactoryBot.create(:travel_plan) }
  describe 'バリデーションのテスト' do
    context 'コメントを入力した場合' do
      it 'バリデーションが通る' do
        chat = FactoryBot.build(:chat, user: user, travel_plan: travel_plan)
        expect(chat).to be_valid
      end
    end
    context 'コメントが空の場合' do
      it 'バリデーションにひっかかる' do
        chat = FactoryBot.build(:chat, content: "", user: user, travel_plan: travel_plan)
        expect(chat).to be_invalid
      end
    end
  end
end
# bundle exec rspec spec/models/travel_plan_spec.rb