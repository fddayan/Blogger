class CreatePruebalocas < ActiveRecord::Migration
  def change
    create_table :pruebalocas do |t|
      t.string :nombre
      t.integer :pelos

      t.timestamps
    end
  end
end
