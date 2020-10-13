FactoryBot.define do
  factory :comment do
    association :user
    association :sound
    text     { Faker::Lorem.sentences } 
  end
end
