FactoryBot.define do
  factory :user do
    email { 'test_email@test.com' }
    password { '123456' }
    password_confirmation { '123456' }
    email_confirmed { true }
  end
end
