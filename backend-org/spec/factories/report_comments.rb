FactoryBot.define do
  factory :report_comment do
    association :user
    association :comment
  end
end
