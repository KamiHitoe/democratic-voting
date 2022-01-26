FactoryBot.define do
  factory :comment do
    # belong_to
    association :topic
    sequence(:user_id) { |n| "#{n}" }
    text { 'test comment' }
  end
end
