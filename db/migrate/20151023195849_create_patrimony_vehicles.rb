class CreatePatrimonyVehicles < ActiveRecord::Migration
  def change
    # Vehículos
    create_table :patrimony_vehicles do |t|
      t.string :function_detail
      t.integer :vehicles_number
      t.float :inventory_value
      t.date :application_date
      t.timestamps
    end
  end
end
