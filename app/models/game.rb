class Game < ActiveRecord::Base
  has_many :players
  belongs_to :team
  belongs_to :opponent, class_name: "Team"
  validates_presence_of :team_id, :opponent_id, :team_score, :opponent_score
  
  def win?
    team_score > opponent_score
  end
  
  def loss?
    !win?
  end

  def result
    if win?
      "Win"
    else
      "Loss"
    end
  end
end
