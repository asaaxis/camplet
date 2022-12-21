require 'rails_helper'
RSpec.describe 'ユーザーモデル機能', type: :system do
  describe 'ユーザー登録テスト' do
    context 'ユーザー新規登録した場合' do
      it 'ユーザーマイページに遷移する' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'test1'
        fill_in 'user[email]', with: 'test1@example.com'
        fill_in 'user[password]', with: 'test11'
        fill_in 'user[password_confirmation]', with: 'test11'
        click_button 'commit'
        expect(page).to have_content 'test1のページ'
      end
    end
    context 'ログインフォーム入力した場合' do
      it 'ログインができること' do
        FactoryBot.create(:user)
        visit user_session_path
        fill_in 'user[email]', with: 'test1@example.com'
        fill_in 'user[password]', with: 'test11'
        click_button 'commit'
        expect(page).to have_content 'test1のページ'
      end
    end
    context 'ログアウト実行した場合' do
      it 'ログアウトができる' do
        FactoryBot.create(:user)
        visit user_session_path
        fill_in 'user[email]', with: 'test1@example.com'
        fill_in 'user[password]', with: 'test11'
        click_button 'commit'
        click_link "ログアウト"
        expect(page).to have_content 'ログアウトしました'
      end
    end
    context 'ログインせずキャンプギア一覧のパスを入力した場合' do
      it 'ログイン画面に遷移する' do
        visit gears_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
end
