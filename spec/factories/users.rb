FactoryGirl.define do

  pass = Faker::Internet.password(6)

  factory :user do
    email { Faker::Internet.email }
    password pass
    password_confirmation pass

    after(:create) do |user|
      temp_group = create(:group)
      create(:message, user: user, group: temp_group)
      create(:group_user, user: user, group: temp_group)
    end
  end

end
