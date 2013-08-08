class AddMoistureLevelToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :moisture_level, :decimal
  end
end
