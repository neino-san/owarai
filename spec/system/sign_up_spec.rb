require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    visit new_user_registration_path
  end

  describe 'サインインページ要素検証' do
    it '入力要素が表示されている' do
      expect(page).to have_selector 'h1.card-title', text: 'アカウント登録'
      expect(page).to have_field '名前'
      expect(page).to have_field 'メールアドレス'
      expect(page).to have_field 'パスワード'
      expect(page).to have_field '確認用パスワード'
      expect(page).to have_button 'アカウント作成'
      expect(page).to have_content 'すでにアカウントをお持ちの方はこちら'
      expect(page).to have_link 'ログイン'
    end
  end

  describe '新規登録機能を検証' do
    it '正常に登録' do
      fill_in '名前', with: 'test_user'
      fill_in 'メールアドレス', with: 'test@test.com'
      fill_in 'パスワード', with: 'password'
      fill_in '確認用パスワード', with: 'password'
      click_button 'アカウント作成'

      @user = User.find_by(name: 'test_user')
      expect(current_path).to eq contents_path(@user.id)
    end

    it '登録不可' do
      fill_in 'アカウント名', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: 'pass'
      fill_in '確認用パスワード', with: 'hoge'
      click_button 'アカウント作成'

      expect(page).to have_content '名前を入力してください'
      expect(page).to have_content 'メールアドレスが入力されていません。'
      expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
      expect(page).to have_content 'パスワードは6文字以上に設定して下さい。'
    end
  end
end
