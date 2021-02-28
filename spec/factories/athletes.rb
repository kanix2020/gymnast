FactoryBot.define do
  factory :athlete do
    name { '西川' }
    affiliation_id { '2' }
    prefecture_id { '2' }
    birthday { 0o000 - 0o0 - 0o0 }
  end
end
