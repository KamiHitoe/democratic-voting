FactoryBot.define do
  factory :comment do
    # belongs_to
    association :user
    association :topic
    text { 'test comment' }
  end
end
