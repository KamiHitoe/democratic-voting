FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    age { |n| n.to_s }
    sex { '女性' }
  end
end
