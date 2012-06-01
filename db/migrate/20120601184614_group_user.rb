class GroupUser < ActiveRecord::Migration
  def up
  	create_table :groups_users do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end

  def down
  end
end
