FactoryGirl.define do

  factory :group do
    id { Faker::Number.between(1,10) }
    name { Faker::Lorem.sentence }
  end

end
