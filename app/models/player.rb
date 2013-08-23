class Player < ActiveRecord::Base
  belongs_to :game, inverse_of: :players

  has_many :objectives, dependent: :destroy
  has_many :rivals, through: :objectives, class_name: 'Player'

  validates_presence_of :name, :game_id

  def competitors
    self.game.players.select { |p|
      p.alive && p.id != self.id
    }
  end
end