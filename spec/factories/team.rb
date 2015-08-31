FactoryGirl.define do
  factory :team do
    school "Atlanta"
    nickname "Hawks"
    city "Atlanta"
    state "Georgia"
    zip "30303"
    league "NBA"
    created_at Time.now
    id 1
    user
  end
end