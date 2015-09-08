class Team < ActiveRecord::Base
  belongs_to :user
  has_many :players
  validates_presence_of :user_id
end
