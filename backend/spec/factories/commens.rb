FactoryBot.define do
  factory :comment do
    # belongs_to
    association :user
    association :topic
    # sequence(:user_id) { |n| n.to_s }
    text { 'test comment' }
  end
end
