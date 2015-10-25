class CreatePatrimonyHistoricals < ActiveRecord::Migration
  def change
    # Bienes históricos
    create_table :patrimony_historicals do |t|
      t.string :inscription
      t.string :subinscription
      t.string :classification
      t.integer :file_number
      t.text :description
      t.date :application_date
      t.timestamps
    end
  end
end
