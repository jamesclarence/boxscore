FactoryGirl.define do
  factory :user do
    firstname "Mike"
    lastname "Budenholzer"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
    id 1
  end
end