require 'rails_helper'

RSpec.describe 'before_and_after_login', type: :system do
  let!(:user_a) { FactoryBot.create(:user) }
  let(:login_user) { user_a }

  describe 'ログイン前後でヘッダーの表示が変更されている' do
    before do
      visit new_user_session_path
    end

    context 'ログイン前' do
      before do
        find('.actions').click
      end

      it '新規登録、ログイン、ゲストログインになっていること' do
        expect(page).to have_link('新規アカウント作成')
        expect(page).to have_link('ログイン')
        expect(page).to have_link('ゲストログイン（閲覧用）')
      end
    end

    context 'ログイン後' do
      before do
        fill_in 'アカウント名', with: user_a.name
        fill_in 'メールアドレス', with: user_a.email
        fill_in 'パスワード', with: user_a.password
        click_button 'Log in'
        find('.actions').click
      end

      it 'ユーザー名、投稿、プロフィール、投稿一覧、ログアウトになっていること' do
        expect(page).to have_content("ログイン中: #{user_a.email}")
        expect(page).to have_link('投稿')
        expect(page).to have_link('プロフィール')
        expect(page).to have_link('投稿一覧')
        expect(page).to have_link('ログアウト')
      end
    end
  end
end
