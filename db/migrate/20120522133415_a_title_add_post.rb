class ATitleAddPost < ActiveRecord::Migration
  def up
  	 drop_table :posts
  	 create_table :posts do |t|
      t.integer :user_id
      t.string :content
      t.string :title
      t.timestamps
    end
  end

  def down
  end
end
