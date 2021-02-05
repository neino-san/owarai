require 'rails_helper'

RSpec.describe User, type: :model do
    let!(:user_a) { FactoryBot.create(:user) }

    describe "バリデーション" do
        it "有効な状態であること" do
        expect(user_a).to be_valid
        end

        it "名前がなければ無効" do
            user = build(:user, name: nil)
            user.valid?
            expect(user.errors[:name]).to include('を入力してください')
        end
        it "名前が35文字以内であること" do
            user = build(:user, name: "a" * 36)
            user.valid?
            expect(user.errors[:name]).to include('は35文字以内で入力してください')
        end
        
        it "メールがなければ無効" do
            user = build(:user, email: nil)
            user.valid?
            expect(user.errors[:email]).to include('が入力されていません。')
        end

        it "パスワードがなければ無効" do
            user = build(:user, password: nil)
            user.valid?
            expect(user.errors[:password]).to include('が入力されていません。')
        end
    end
end