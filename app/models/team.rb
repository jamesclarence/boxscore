class Team < ActiveRecord::Base
  belongs_to :user
  has_many :players
  has_many :games
  has_many :stats, through: :games
  
  validates_presence_of :user_id
end
