require 'rails_helper'

RSpec.describe 'チームモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'チーム名を入力した場合' do
      it 'バリデーションが通る' do
        team = FactoryBot.create(:team, name: 'わいわい')
        expect(team).to be_valid
      end
    end
    context 'チーム名が空の場合' do
      it 'バリデーションにひっかかる' do
        team = FactoryBot.build(:team, name: '')
        expect(team).to be_invalid
      end
    end
    context 'チーム名が20文字以上の場合' do
      it 'バリデーションにひっかかる' do
        team = FactoryBot.build(:team, name: "#{'わいわいわい' * 5}")
        expect(team).to be_invalid
      end
    end
  end
end
