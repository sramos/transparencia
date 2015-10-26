class AddLatitudeAndLongitudeToPatrimonyRentingBuilding < ActiveRecord::Migration
  def change
    add_column :patrimony_renting_buildings, :latitude, :float
    add_column :patrimony_renting_buildings, :longitude, :float
  end
end
