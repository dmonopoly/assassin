class Game < ActiveRecord::Base
  has_many :players, dependent: :destroy, inverse_of: :game

  validates_presence_of :name
end
