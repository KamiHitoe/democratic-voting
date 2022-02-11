FactoryBot.define do
  factory :report_topic do
    association :user
    association :topic
  end
end
