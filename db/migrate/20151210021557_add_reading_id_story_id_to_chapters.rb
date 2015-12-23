class AddReadingIdStoryIdToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :reading_id, :integer
    add_column :chapters, :story_id, :integer

  end
end
