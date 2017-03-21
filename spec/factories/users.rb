FactoryGirl.define do

  factory :user do
    id { Faker::Number.between(1,10) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

end
