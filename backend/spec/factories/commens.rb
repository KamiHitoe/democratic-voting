FactoryBot.define do
  factory :comment do
    # belong_to
    association :topic
    sequence(:user_id) { |n| n.to_s }
    text { 'test comment' }
  end
end
