FactoryGirl.define do

  pass = Faker::Internet.password(6)

  factory :user do
    email { Faker::Internet.email }
    password pass
    password_confirmation pass
  end

end
