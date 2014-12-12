
FactoryGirl.define do
  factory :admin_user do
    email { Faker::Internet.email }
    password 'Hej123jeh'
    password_confirmation 'Hej123jeh'
  end
end