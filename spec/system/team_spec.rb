require 'rails_helper'
RSpec.describe 'チーム管理機能', type: :system do
  let!(:team_member) { FactoryBot.create(:second_user) }
  let!(:owner_user) { FactoryBot.create(:user) }
  let!(:team) { FactoryBot.create(:team, owner: owner_user) }
  let!(:assign) { FactoryBot.create(:assign, user: owner_user, team: team) }
  let!(:assign) { FactoryBot.create(:assign, user: team_member, team: team) }
  describe '新規作成機能' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: 'test1@example.com'
      fill_in 'user[password]', with: 'test11'
      click_on 'commit'
    end
    context 'チームを作成した場合' do
      it '作成したチームが表示される' do
        visit new_team_path
        fill_in 'team[name]', with: 'new team'
        click_on 'commit'
        expect(page).to have_content 'new team'
      end
    end
    context '登録したチームを' do
      it '編集できること' do
        visit edit_team_path(team)
        fill_in 'team[name]', with: 'test2_team'
        click_on 'commit'
        expect(page).to have_content 'test2_team'
      end
      it '削除ができること' do
        visit team_path(team)
        click_button 'チーム削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'test1_team'
      end
    end
  end
  describe 'チーム招待機能' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: 'test1@example.com'
      fill_in 'user[password]', with: 'test11'
      click_on 'commit'
    end
    context 'ユーザーを招待した場合' do
      it 'メンバーに表示される' do
        new_member = FactoryBot.create(:user, name: 'new user', email: 'new_member@example.com', id: 3)
        visit team_path(team)
        fill_in 'post[email]', with: 'new_member@example.com'
        click_on '招待'
        expect(page).to have_content new_member.name
      end
    end
  end
  describe 'チーム退会機能' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: 'test2@example.com'
      fill_in 'user[password]', with: 'test22'
      click_on 'commit'
    end
    context 'チームを退出した場合' do
      it 'マイページに遷移する' do
        visit team_path(team)
        click_button 'チームから退出'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'test2のページ'
      end
    end
  end
end
