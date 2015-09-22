FactoryGirl.define do
  factory :game do
    team
    opponent

    time "2015-09-08 08:56:41"
    date "2015-09-08 08:56:41"
    location "Philips Arena"
    team_score 2
    opponent_score 1
  end
end
