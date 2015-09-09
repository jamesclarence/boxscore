class Stat < ActiveRecord::Base
  belongs_to :player

  # Played In Game?
  def game_played?
    minutes > 0
  end

  # Field Goal Percentage
  def fg_pct
    fg/fga
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
    two_pt/two_pt_a
  end

  # Three Point Field Goal Percentage
  def three_pt_pct
    three_p/three_p_a
  end

  # Free Throw Percentage
  def ft_pct
    ft/fta
  end

  # True Shooting Attempts
  def tsa
    fga + 0.44 * fta
  end

  # True Shooting Percentage
  def ts_pct
    points/(2 * tsa)
  end

  # Effective Field Goal Percentage
  def efg
    (fg + 0.5 * three_p_a)/fga
  end

  # Total Rebounds
  def trb
    orb + drb
  end

  # Verify Points
  # def verify_points
  #   points == (two_pt * 2) + (three_p * 3) + ft
  # end

  # # Verify Field Goal Attemps
  # def verify_fga
  #   fga = two_pt_a + three_p_a
  # end
end
