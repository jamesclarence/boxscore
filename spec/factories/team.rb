FactoryGirl.define do
  factory :team do
    user
    
    school "Atlanta"
    nickname "Hawks"
    city "Atlanta"
    state "Georgia"
    zip "30303"
    league "NBA"
  end
end