FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    age { 20 }
    sex { '女性' }
  end
end
