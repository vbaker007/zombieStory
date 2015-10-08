class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :story_id
      t.integer :chapter_id
      t.integer :scenario_id
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
