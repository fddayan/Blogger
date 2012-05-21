class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :mail
      t.string :password
      t.string :image
      t.string :birthdate

      t.timestamps
    end
  end
end
