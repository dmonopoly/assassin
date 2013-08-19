class Game < ActiveRecord::Base
  has_many :players

  validates_presence_of :name

end
