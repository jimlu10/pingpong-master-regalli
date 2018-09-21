FactoryBot.define do
  factory :game do
    game_date { Faker::Date.between(2.years.ago, Date.today) }
    association :player, factory: :user
    association :opponent, factory: :user
  end
end
