require 'rails_helper'
RSpec.describe 'キャンプギア管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:gear) { FactoryBot.create(:gear, user: user) }
  describe '新規作成機能' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: 'test1@example.com'
      fill_in 'user[password]', with: 'test11'
      click_on'commit'
    end
    context 'キャンプギアを登録した場合' do
      it '作成したキャンプギアが表示される' do
        visit new_gear_path
        fill_in '名前',with: 'テント'
        fill_in '詳細',with: '4人入れます'
        fill_in '数量' ,with: '1'
        click_on 'commit'
        expect(page).to have_content 'テント'
      end
    end
    context '登録したキャンプギアを' do
      it '編集ができること' do
        visit edit_gear_path(gear.id)
        fill_in '名前',with: 'てんと'
        fill_in '詳細',with: '2人入れます'
        fill_in '数量' ,with: '2'
        click_button 'commit'
        expect(page).to have_content 'てんと'
      end
      it '削除ができること' do
        visit gear_path(gear.id)
        click_link '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'ギアを削除しました.'
      end
    end
  end
end
# bundle exec rspec spec/system/gear_spec.rb