class Objective < ActiveRecord::Base
  belongs_to :player
  belongs_to :rival, class_name: 'Player'
end
