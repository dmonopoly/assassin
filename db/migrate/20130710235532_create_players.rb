class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :alive, :default => true

      t.timestamps
    end
  end
end
