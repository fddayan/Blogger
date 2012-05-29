class Drop < ActiveRecord::Migration
  def up  	
  	remove_column :users, :mail
  end

  def down
  end
end
