class Game < ActiveRecord::Base
  has_many :players
  belongs_to :team
  
  def win
    team_score > opponent_score
  end
  
  def loss
    opponent_score > team_score
  end
end
