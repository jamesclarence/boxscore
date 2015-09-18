FactoryGirl.define do
  factory :user do
    firstname "Mike"
    lastname "Budenholzer"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end

  factory :opponent_user, class: User do
    firstname "Sam"
    lastname "Hinkie"
    email { "#{firstname}.#{lastname}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end