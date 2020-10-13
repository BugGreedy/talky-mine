FactoryBot.define do
  factory :sound do
      association :user
      title                 { Faker::Creature::Animal.name }
      text                  { Faker::Lorem.sentences }
      genre_id              { Faker::Number.between(from: 1, to: 6)} 
  end
end
