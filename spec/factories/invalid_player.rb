FactoryGirl.define do
  factory :invalid_player, parent: :player do |f|
    f.lastname nil
  end
end