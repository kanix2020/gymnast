FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password { '00000a' }
    password_confirmation { password }
    lastname { '阿部' }
    firstname { '寛' }
    birthday { 0o000 - 0o0 - 0o0 }
  end
end