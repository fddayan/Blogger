class DropTags < ActiveRecord::Migration
  def up
  	drop_table :tags
    drop_table :posts_tags
  end

  def down
  end
end
