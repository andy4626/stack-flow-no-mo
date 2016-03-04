require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    password "password"
  end

  factory :question do
    association :user
    title {Faker::Name.title}
    content {Faker::Hipster.paragraph}
  end

  factory :answer do
    association :user
    content {Faker::Hipster.paragraph}
  end


end
