FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname            { person.kanji }
    birthday            { Faker::Date.birthday }
    sex                 { Faker::Number.within(range: 1..2) }
    email               { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end

