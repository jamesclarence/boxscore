class Game < ActiveRecord::Base
  has_many :players
  belongs_to :team
  belongs_to :opponent, class_name: "Team"
  
  def win?
    team_score > opponent_score
  end
  
  def loss?
    !win?
  end

  def result
    if win?
      "win"
    else
      "loss"
    end
  end
end
