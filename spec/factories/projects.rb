# spec/factories/projects.rb

FactoryBot.define do
    factory :project do
      title { Faker::Lorem.sentence }
      description { Faker::Lorem.paragraph }
      start_date { Faker::Date.backward(days: 14) }
      end_date { Faker::Date.forward(days: 14) }
    end
  end
  