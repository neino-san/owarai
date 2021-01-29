require 'rails_helper'

RSpec.describe "sign_in", type: :request do
  describe "サインイン" do
    before do
      #factory_botを利用して認証モデルを作成します。
      @user = create(:user)
    end

    it "works! (now write some real specs)" do
      sign_in @user
      get new_user_registration_path
      expect(response).to have_http_status(302)
    end
  end
end