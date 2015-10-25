namespace :patrimony do
  desc "Importacion de inmuebles"
  task :import_buildings => :environment do
    puts "\n\n"
    puts "***************************************"
    puts "********** Buildings Import ***********"
    puts "***************************************"
    puts ""

    puts "\nXLSX file to import buildings? (full path)"
    file = $stdin.gets.chomp
    fields = [:district, :use_type, :catalog, :file_number, :nature, :address, :description]
    import_from_xlsx file, PatrimonyBuilding, fields
  end

  desc "Importacion de arrendamientos"
  task :import_renting_buildings => :environment do
    puts "\n\n"
    puts "***********************************************"
    puts "********** Renting buildings Import ***********"
    puts "***********************************************"
    puts ""

    puts "\nXLSX file to import renting buildings? (full path)"
    file = $stdin.gets.chomp
    fields = [:subinscription, :file_number, :nature, :address, :description]
    import_from_xlsx file, PatrimonyRentingBuilding, fields
  end

  desc "Importacion de bienes historicos"
  task :import_historical => :environment do
    puts "\n\n"
    puts "*****************************************"
    puts "********** Historicals Import ***********"
    puts "*****************************************"
    puts ""

    puts "\nXLSX file to import historical goods? (full path)"
    file = $stdin.gets.chomp
    fields = [:inscription, :subinscription, :classification, :file_number, :description]
    import_from_xlsx file, PatrimonyHistorical, fields
  end

  desc "Importacion de vehiculos"
  task :import_vehicles => :environment do
    puts "\n\n"
    puts "**************************************"
    puts "********** Vehicles Import ***********"
    puts "**************************************"
    puts ""

    puts "\nXLSX file to import vehicles? (full path)"
    file = $stdin.gets.chomp
    fields = [:function_detail, :vehicles_number, :inventory_value]
    import_from_xlsx file, PatrimonyVehicle, fields
    # El ultimo campo importado suele ser el total, asi que lo evitamos
    PatrimonyVehicle.last.destroy
  end

  desc "Importacion de vehiculos en renting"
  task :import_renting_vehicles => :environment do
    puts "\n\n"
    puts "**********************************************"
    puts "********** Renting Vehicles Import ***********"
    puts "**********************************************"
    puts ""

    puts "\nXLSX file to import renting vehicles? (full path)"
    file = $stdin.gets.chomp
    fields = [:function_detail, :vehicles_number, :model]
    import_from_xlsx file, PatrimonyRentingVehicle, fields
  end

private

  def import_from_xlsx file=nil, model=nil, fields=nil
    if file && File.readable?(file) && model && fields
      puts "*** Importing from: " + file
      xlsx = Roo::Spreadsheet.open(file, extension: :xlsx)
      puts "    Delete existing objects."
      model.destroy_all
      puts "    Reading file..."
      xlsx.each_row_streaming(offset: 1) do |row|
        attribs = {application_date: Date.new(2014,12,31)}
        fields.each_with_index { |field,index| attribs[field] = value(row[index]) }
        prb = model.create attribs
      end 
      puts "    %{num} objects imported."%{num: model.count}
    else
      puts "*** Unable to open: " + file unless file.nil? || File.readable?(file)
    end
  end

  def value dato
    value = dato ? dato.value : nil
    value.strip! if value.class.name == "String"
    return value
  end
end
