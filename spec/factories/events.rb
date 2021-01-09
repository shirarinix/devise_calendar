FactoryBot.define do
  factory :event do
    title               { Faker::Internet.domain_word }
    content             { Faker::Lorem.sentence }
    start_time          { Faker::Date.backward }
  end
end