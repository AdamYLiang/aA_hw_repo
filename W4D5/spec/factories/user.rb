
FactoryBot.define do 
  factory :user do 
    email { Faker::StarWars.character }
    password { "password" }
  end
end