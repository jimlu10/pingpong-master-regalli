FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'sjkdh2948sjs' }


  end
end
