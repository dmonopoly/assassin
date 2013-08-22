class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.integer :player_id
      t.integer :rival_id
      t.boolean :is_target

      t.timestamps
    end
  end
end
