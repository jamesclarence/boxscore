class Game < ActiveRecord::Base
  belongs_to :team
  belongs_to :opponent, class_name: "Team"
  has_many :stats
  has_many :players, through: :team
  
  validates_presence_of :team_id, :opponent_id, :team_score, :opponent_score
  
  default_scope { order(date: :desc) }

  def date
    self[:date].to_date
  end

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
