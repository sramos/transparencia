class CreatePatrimonyBuildings < ActiveRecord::Migration
  def change
    # Edificios Inmuebles
    create_table :patrimony_buildings do |t|
      # No pueden usarse distritos desde una tabla porque tambien se incluyen
      # aqui otras localidades distintas de madrid
      t.string :district
      # Tipo: bienes de dominio público, bienes patrimoniales, hay más?...
      t.string :use_type
      # Apartado: servicios administrativos, servicios sociales, ...
      t.string :catalog
      # Num registro
      t.integer :file_number
      # Referencia catastral (deberia incluirse incluso como obligatorio, pero ahora no hay datos)
      t.string :cadastral_reference
      # Naturaleza: Urbana (tambien rustica?)
      t.string :nature
      # Direccion
      t.string :address
      # Descripcion y uso
      t.text :description
      # Fecha del dato (para contemplar diferentes años)
      t.date :application_date
      t.timestamps
    end
  end
end

