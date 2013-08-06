class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :plant_id
      t.string :message

      t.timestamps
    end
  end
end
