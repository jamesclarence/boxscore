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

  factory :team_with_players do
    transient do
      players_count 2
    end

    after(:create) do |team, evaluator|
      create_list(:player, evaluator.players_count, team: team)
    end
  end

  factory :opponent_team, class: Team do
    user

    school "Philadelphia"
    nickname "76ers"
    city "Philadelphia"
    state "PA"
    zip "19148"
    league "NBA"
  end
end