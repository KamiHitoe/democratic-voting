FactoryBot.define do
  factory :vote do
    association :user
    association :topic
    sex { %w[male female].sample }
    age { [10, 20, 30, 40, 50].sample }
    chosen_option { rand(1..4) }
  end
end
