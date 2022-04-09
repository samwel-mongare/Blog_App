FactoryBot.define do
  factory :item do
    title { Faker::Name.name }
    text  { Faker::Lorem.word }
    post_id nil
  end
end