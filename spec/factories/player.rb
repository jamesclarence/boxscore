FactoryGirl.define do
  factory :player do
    team

    firstname "Al"
    lastname "Horford"
    position "Center"
    number 15
    height 82
    weight 250
  end

  factory :player_2, class: Player do
    team

    firstname "Paul"
    lastname "Millsap"
    position "PF"
    number 4
    height 80
    weight 253
  end


end