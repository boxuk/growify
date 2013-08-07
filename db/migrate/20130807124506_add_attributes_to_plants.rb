class AddAttributesToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :light_level, :integer
    add_column :plants, :humidity_level, :integer
    add_column :plants, :temperature, :decimal
  end
end
