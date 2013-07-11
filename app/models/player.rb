class Player < ActiveRecord::Base
  belongs_to :game
  has_one :target, :class_name => 'Player'
  has_one :assassin, :class_name => 'Player'

  validates_presence_of :name
end
