require 'rails_helper'

RSpec.describe 'User', type: :system do
  let!(:user_a) { FactoryBot.create(:user) }
  let(:login_user) { user_a }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
  end

  describe 'ユーザー情報編集要素' do
    let(:login_user) { user_a }

    before do
      visit edit_user_path(user_a.id)
    end

    context 'ユーザー編集' do
      it 'ユーザー情報編集要素の表示' do
        expect(page).to have_selector '.default_image'
        expect(page).to have_field 'user_name'
        expect(page).to have_field 'user_profile'
        expect(page).to have_button '更新'
      end
    end
  end

  describe 'ユーザー情報編集' do
    let(:login_user) { user_a }

    before do
      visit edit_user_path(user_a.id)
    end

    context '正常に編集された時' do
      before do
        fill_in 'user_name', with: 'user_b'
        fill_in 'user_profile', with: 'よろしくお願いします'
        click_button '更新'
      end

      it 'コンテンツ一覧ページにユーザー情報の変更が反映' do
        expect(current_path).to eq contents_path
        expect(page).to have_content 'user_b'
        expect(page).to have_content 'よろしくお願いします'
      end
    end

    context '変更不可' do
      before do
        fill_in 'user_name', with: ' '
        fill_in 'user_profile', with: 'あ' * 201
        click_button '変更'
      end

      it 'コンテンツ一覧ページにユーザー情報の変更が反映されない' do
        expect(current_path).to eq "/users/#{user_a.id}"
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content 'Profileは200文字以内で入力してください'
      end
    end
  end
end
