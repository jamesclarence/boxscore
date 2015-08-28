FactoryGirl.define do
  factory :team do
    school "Atlanta"
    nickname "Hawks"
    city "Atlanta"
    state "Georgia"
    zip "30303"
    league "NBA"
    created_at Time.now
    user
  end
end