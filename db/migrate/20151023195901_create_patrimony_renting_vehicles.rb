class CreatePatrimonyRentingVehicles < ActiveRecord::Migration
  # This table should be linked with renting contract from contracts table
  def change
    create_table :patrimony_renting_vehicles do |t|
      # Vehicle model
      t.string :model
      # "cargos electos" or "apoyo a la gestion de servicios"
      t.boolean :sevices_support, null: false, default: true 
      # councilman charge or service name
      t.string :function_detail
      # number of vehicles assigned
      t.integer :vehicles_number
      t.date :application_date
      t.timestamps
    end
  end
end
