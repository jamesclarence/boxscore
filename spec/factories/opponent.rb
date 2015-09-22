FactoryGirl.define do
  factory :opponent, class: Team do
    user

    school "Philadelphia"
    nickname "76ers"
    city "Philadelphia"
    state "PA"
    zip "19148"
    league "NBA"
  end
end