FactoryBot.define do
  factory :user do
   name { "name" }
   email { "test1@test.com"}
   password { "password" }
   password_confirmation { "password"}
  end
end