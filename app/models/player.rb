class Player < ActiveRecord::Base
  belongs_to :game
  has_one :target, :class_name => 'Player', :foreign_key => 'target_id'
  has_one :assassin, :class_name => 'Player', :foreign_key => 'assassin_id'

  validates_presence_of :name
end
