FactoryBot.define do
  factory :bus do
    duration { 240 }
    scheduled_on { "2020-12-25 07:00:00" }
    from_busport_id { 1 }
    to_busport_id { 2 }
    # association :busport
    # association :busport, class: "busport", foreign_key: "from_busport_id"
    # association :busport, class_name: "busport", foreign_key: "to_busport_id"
  end
end