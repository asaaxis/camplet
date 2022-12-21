require 'rails_helper'

RSpec.describe '旅行プランモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '行き先を入力した場合' do
      it 'バリデーションが通る' do
        travel_plan = FactoryBot.build(:travel_plan)
        expect(travel_plan).to be_valid
      end
    end
    context '行き先が空の場合' do
      it 'バリデーションにひっかかる' do
        travel_plan = FactoryBot.build(:travel_plan, name: "")
        expect(travel_plan).to be_invalid
      end
    end
  end
end
