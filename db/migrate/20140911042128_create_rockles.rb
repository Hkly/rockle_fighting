class CreateRockles < ActiveRecord::Migration
  def change
    create_table :rockles do |t|
      t.string :name, null: false
      t.string :species, null: false
      t.integer :user_id, null: false
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.integer :max_hp
      t.integer :hp_points, default: 0
      t.integer :atk_points, default: 0
      t.integer :def_points, default: 0
      t.integer :spd_points, default: 0

      t.timestamps
    end
    add_index :rockles, :name, unique: true
    add_index :rockles, :user_id, unique: true
  end
end
