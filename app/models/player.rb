class Player < ActiveRecord::Base
  belongs_to :team
  has_many :games
  has_many :stats

  validates_presence_of :team_id, :firstname, :lastname
end
