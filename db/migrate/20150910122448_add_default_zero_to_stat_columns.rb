class AddDefaultZeroToStatColumns < ActiveRecord::Migration
  def change
      change_column_default :stats, :fg, 0
      change_column_default :stats, :fga, 0
      change_column_default :stats, :three_p, 0
      change_column_default :stats, :three_p_a, 0
      change_column_default :stats, :orb, 0
      change_column_default :stats, :drb, 0
      change_column_default :stats, :assists, 0
      change_column_default :stats, :steals, 0
      change_column_default :stats, :blocks, 0
      change_column_default :stats, :turnovers, 0
      change_column_default :stats, :fouls, 0
      change_column_default :stats, :minutes, 0
      change_column_default :stats, :points, 0
  end
end
