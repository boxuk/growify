class AddMoistureLevelToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :moisture_level, :decimal
  end
end
