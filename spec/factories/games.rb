FactoryBot.define do
  factory :game do
    name { '全日本インカレ' }
    venue { '北九州総合体育館' }
    prefecture_id { '2' }
    event_day { 0o000 - 0o0 - 0o0 }
  end
end
