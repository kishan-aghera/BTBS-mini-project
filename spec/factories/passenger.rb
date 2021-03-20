FactoryBot.define do
  factory :passenger do
    name { Faker::Name.name }
    email { "abc@gmail.com" }
    association :booking
  end
end