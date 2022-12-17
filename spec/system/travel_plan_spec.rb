require 'rails_helper'
RSpec.describe '旅行プラン管理機能', type: :system do
  let!(:team) { FactoryBot.create(:team) }
  let!(:assign) { FactoryBot.create(:assign) }
  let!(:travel_plan) { FactoryBot.create(:travel_plan, team: team) }
  describe '新規作成機能' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: 'test1@example.com'
      fill_in 'user[password]', with: 'test11'
      click_on'commit'
    end
    context '旅行プランを作成した場合' do
      it '作成した旅行プランが表示される' do
        visit new_team_travel_plan_path(team.id)
        fill_in '行き先',with: 'Tokyo'
        select '2023', from: 'travel_plan_start_schedule_at_1i'
        select '8月', from: 'travel_plan_start_schedule_at_2i'
        select '1', from: 'travel_plan_start_schedule_at_3i'
        select '00', from: 'travel_plan_start_schedule_at_4i'
        select '00', from: 'travel_plan_start_schedule_at_5i'

        select '2023', from: 'travel_plan_end_schedule_at_1i'
        select '8月', from: 'travel_plan_end_schedule_at_2i'
        select '3', from: 'travel_plan_end_schedule_at_3i'
        select '00', from: 'travel_plan_end_schedule_at_4i'
        select '00', from: 'travel_plan_end_schedule_at_5i'
        click_on 'commit'
        # byebug
        expect(page).to have_content 'Tokyo'
      end
    end
    context '登録した旅行プランを' do
      it '編集ができること' do
        find('#rspec-edit').click
        click_button '詳細'
        click_on '旅行一覧'
        click_button '詳細'
        click_button '編集'
        fill_in '行き先',with: 'OSAKA'
        select '2023', from: 'travel_plan_start_schedule_at_1i'
        select '9月', from: 'travel_plan_start_schedule_at_2i'
        select '1', from: 'travel_plan_start_schedule_at_3i'
        select '00', from: 'travel_plan_start_schedule_at_4i'
        select '00', from: 'travel_plan_start_schedule_at_5i'

        select '2023', from: 'travel_plan_end_schedule_at_1i'
        select '9月', from: 'travel_plan_end_schedule_at_2i'
        select '3', from: 'travel_plan_end_schedule_at_3i'
        select '00', from: 'travel_plan_end_schedule_at_4i'
        select '00', from: 'travel_plan_end_schedule_at_5i'
        click_button 'commit'
        # byebug
        expect(page).to have_content 'OSAKA'
      end
      it '削除ができること' do
        visit travel_plan_path(travel_plan.id)
        click_link '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'Tokyo'
      end
    end
  end
end
# bundle exec rspec spec/system/travel_plan_spec.rb