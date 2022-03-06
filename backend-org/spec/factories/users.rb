FactoryBot.define do
  factory :user do
    uid { ('a'..'z').to_a.shuffle.join }
    age { 20 }
    sex { 'female' }
  end
end
