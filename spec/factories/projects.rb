FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Time.backward(days: 14, period: :all) }
    end_date { Faker::Time.forward(days: 14, period: :all) }
  end
end
