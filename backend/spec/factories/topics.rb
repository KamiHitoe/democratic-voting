FactoryBot.define do
  factory :topic do
    sequence(:user_id) { |n| "#{n}" }
    sequence(:category_id) { |n| "#{n}" }
    title { 'test title' }
    description { 'test description' }
    option_1 { 'test op1' }
    option_2 { 'test op2' }
    option_3 { 'test op3' }
    option_4 { 'test op4' }

  end

end
