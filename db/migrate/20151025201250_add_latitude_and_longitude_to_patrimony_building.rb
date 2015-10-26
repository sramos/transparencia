class AddLatitudeAndLongitudeToPatrimonyBuilding < ActiveRecord::Migration
  def change
    add_column :patrimony_buildings, :latitude, :float
    add_column :patrimony_buildings, :longitude, :float
  end
end
