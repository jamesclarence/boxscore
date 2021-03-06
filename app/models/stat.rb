class Stat < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many :teams, through: :game

  # validate :points_validation
  validates_presence_of :game_id, :player_id
  validates_with StatsValidator


  # def points
  #   (two_pt * 2) + (three_p * 3) + ft   
  # end

  # Played In Game?
  def game_played?
    minutes > 0
  end

  # Field Goal Percentage
  def fg_pct
    return 0.0 if fga.zero?
    
    (fg.to_f/fga).round(3)  
  end

  # Two Point Shots Made
  def two_pt
    fg - three_p
  end

  # Two Point Shot Attempts
  def two_pt_a
    fga - three_p_a
  end

  # Two Point Field Goal Percentage
  def two_pt_pct
    return 0.0 if two_pt.zero? || two_pt_a.zero?

    (two_pt.to_f/two_pt_a).round(3)
  end

  # Three Point Field Goal Percentage
  def three_pt_pct
    return 0.0 if three_p.zero? || three_p_a.zero? 

    (three_p.to_f/three_p_a).round(3)
  end

  # Free Throw Percentage
  def ft_pct
    return 0.0 if ft.zero? || fta.zero?

    (ft.to_f/fta).round(3)
  end

  # True Shooting Attempts
  def tsa
    fga + 0.44 * fta
  end

  # True Shooting Percentage
  def ts_pct
    return 0.0 if tsa.zero? || points.zero?

    (points.to_f/(2 * tsa)).round(3)
  end

  # Effective Field Goal Percentage
  def efg
    return 0.0 if fg.zero? || fga.zero?

    ((fg.to_f + 0.5 * three_p.to_f)/fga).round(3)
  end

  # Total Rebounds
  def trb
    orb + drb
  end

    # Points
  def points_validation
    if points != ((two_pt * 2) + (three_p * 3) + ft)
      errors.add(:stat, "Points must equal 2P, 3P, and FT made")
    end
  end

  # Some statistic formulas from the following sources:
    # Kevin Pelton: http://www.nba.com/thunder/news/stats101.html
    # Basketball Reference: http://www.basketball-reference.com/about/glossary.html
end
