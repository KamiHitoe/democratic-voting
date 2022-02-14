FactoryBot.define do
  factory :topic do
    sequence(:id) { |n| n.to_s }
    association :user
    sequence(:category_id) { |n| n.to_s }
    title { 'test title' }
    description { 'test description' }
    sex { 'female' }
    age { 20 }
    option_1 { 'test op1' }
    option_2 { 'test op2' }
    option_3 { 'test op3' }
    option_4 { 'test op4' }
  end
end
