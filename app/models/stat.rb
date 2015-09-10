class Stat < ActiveRecord::Base
  belongs_to :player

  # Played In Game?
  def game_played?
    minutes > 0
  end

  # Field Goal Percentage
  def fg_pct
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
    (two_pt.to_f/two_pt_a).round(3)
  end

  # Three Point Field Goal Percentage
  def three_pt_pct
    (three_p.to_f/three_p_a).round(3)
  end

  # Free Throw Percentage
  def ft_pct
    (ft.to_f/fta).round(3)
  end

  # True Shooting Attempts
  def tsa
    fga + 0.44 * fta
  end

  # True Shooting Percentage
  def ts_pct
    (points.to_f/(2 * tsa)).round(3)
  end

  # Effective Field Goal Percentage
  def efg
    ((fg.to_f + 0.5 * three_p.to_f)/fga).round(3)
  end

  # Total Rebounds
  def trb
    orb + drb
  end

  # Verify Points
  def verify_points?
    points == (two_pt * 2) + (three_p * 3) + ft
  end

  # Verify Field Goal Attemps
  def verify_fga?
    fga == two_pt_a + three_p_a
  end

  # Some statistics from the following sources:
    # Kevin Pelton: http://www.nba.com/thunder/news/stats101.html
    # Basketball Reference: http://www.basketball-reference.com/about/glossary.html
end
