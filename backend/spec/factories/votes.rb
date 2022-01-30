FactoryBot.define do
  factory :vote do
    association :user
    association :topic
  end
end
