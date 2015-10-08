class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
