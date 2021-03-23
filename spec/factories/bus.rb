FactoryBot.define do
  factory :bus do
    duration { 240 }
    scheduled_on { "2020-12-25 07:00:00" }
    from_busport { association :busport }
    to_busport { association :busport }
  end
end
