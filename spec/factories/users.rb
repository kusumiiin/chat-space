FactoryGirl.define do

  pass = Faker::Internet.password(6)

  factory :user do
    id { Faker::Number.between(1,10) }
    email { Faker::Internet.email }
    password pass
    password_confirmation pass
  end

end
