class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :desc
      t.text :base_text
      t.binary :image

      t.timestamps null: false
    end
  end
end
