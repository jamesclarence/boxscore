class Player < ActiveRecord::Base
  belongs_to :team
  has_many :games, through: :team
  has_many :stats #, through: :games

  validates_presence_of :team_id, :firstname, :lastname

  # Scope: All of a Player's Games
  # scope :player_games, joins(:games).where('.field = ?', 'value')

  # Player.games.stats doesn't work
  # Team.players.stats doesn't work
  # Game.stats works (lists individual stats with own unique stat id)
  # Stat.where(player_id: :id) works

  # scope :player_stats, -> { where  }
end
