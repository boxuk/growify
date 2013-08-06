class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name

      t.timestamps
    end
  end
end
