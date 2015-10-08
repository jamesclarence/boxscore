class Game < ActiveRecord::Base
  belongs_to :team
  belongs_to :opponent, class_name: "Team"
  has_many :stats
  has_many :players, through: :team

  accepts_nested_attributes_for :stats

  validates_presence_of :team_id, :opponent_id, :team_score, :opponent_score

  default_scope { order(date: :desc) }

  def date
    self[:date].to_date
  end

  scope :win, -> { where("team_score > opponent_score") }
  scope :loss, -> { where("opponent_score > team_score") }

  def result
    if team_score > opponent_score
      "Win"
    else
      "Loss"
    end
  end
end
