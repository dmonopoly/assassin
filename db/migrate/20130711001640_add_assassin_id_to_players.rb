class AddAssassinIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :assassin_id, :integer
  end
end
