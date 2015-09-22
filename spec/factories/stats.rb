FactoryGirl.define do
  factory :stat do
    player
    game

    points 31
    fg 10
    fga 20
    three_p 3
    three_p_a 6
    ft 8
    fta 10
    orb 2
    drb 6
    assists 7
    steals 3
    blocks 1
    turnovers 3
    fouls 4
    minutes 25
  end
end
