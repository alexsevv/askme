FactoryGirl.define do
  factory :user do
    password 'qwerty'
    sequence(:email) { |n| "user#{n}@example.org" }
    sequence(:username) { |n| "sasha_#{n}" }
    header_color '#005a55'
  end
end
