FactoryBot.define do
  factory :todo do
    title { Faker::Name.name }
    text  { Faker::Lorem.word }
  end
end