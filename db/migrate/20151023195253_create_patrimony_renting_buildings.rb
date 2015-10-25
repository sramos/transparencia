class CreatePatrimonyRentingBuildings < ActiveRecord::Migration
  # This table should be linked with renting contract from contracts table
  def change
    create_table :patrimony_renting_buildings do |t|
      # Subepigrafe: arrendamientos, derechos de uso, derechos de edificacion, usufructos y servidumbres, censos, otros derechos reales. Hay mas?
      t.string :subinscription 
      # Naturaleza del dominio: patrimonial, bien publico, hay mas?
      t.string :nature
      # Numero de registro
      t.integer :file_number
      # Referencia catastral (actualmente no existe, pero deberia incluirse en el futuro)
      t.string :cadastral_reference
      # Direccion
      t.string :address
      # Descripcion y uso del inmueble
      t.text :description
      # Fecha del dato
      t.date :application_date
      t.timestamps
    end
  end
end
