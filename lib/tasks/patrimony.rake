namespace :patrimony do
  desc "Importacion de inmuebles"
  task :buildings => :environment do
    puts "\n\n"
    puts "***************************************"
    puts "********** Buildings Import ***********"
    puts "***************************************"
    puts ""

    puts "\nXLSX file to import buildings? (full path)"
    file = $stdin.gets.chomp
    if File.readable?(file)
      puts "*** Importing buildings from: " + file

      xlsx = Roo::Spreadsheet.open(file, extension: :xlsx)
      puts xlsx.info.inspect

      puts "    Delete existing buildings."
      PatrimonyBuilding.destroy_all
      fields = [:district, :use_type, :catalog, :file_number, :nature, :address, :description]
      puts "    Reading buildings..."
      xlsx.each_row_streaming do |row|
        attribs = {application_date: Date.new(2014,12,31)}
        fields.each_with_index { |field,index| attribs[field] = value(row[index]) }
        pb = PatrimonyBuilding.create attribs
      end
      puts "    %{num} buildings imported."%{num: PatrimonyBuilding.all.count}
    else
      puts "*** Unable to open: " + file
    end
  end

  desc "Importacion de arrendamientos"
  task :renting_buildings => :environment do
    puts "\n\n"
    puts "***********************************************"
    puts "********** Renting buildings Import ***********"
    puts "***********************************************"
    puts ""

    puts "\nXLSX file to import renting buildings? (full path)"
    file = $stdin.gets.chomp
    if File.readable?(file)
      puts "*** Importing renting buildings from: " + file

      xlsx = Roo::Spreadsheet.open(file, extension: :xlsx)
      puts xlsx.info.inspect

      puts "    Delete existing renting buildings."
      PatrimonyRentingBuilding.destroy_all
      fields = [:subinscription, :file_number, :nature, :address, :description]
      puts "    Reading rentings..."
      xlsx.each_row_streaming do |row|
        attribs = {application_date: Date.new(2014,12,31)}
        fields.each_with_index { |field,index| attribs[field] = value(row[index]) }
        prb = PatrimonyRentingBuilding.create attribs
      end
      puts "    %{num} renting buildings imported."%{num: PatrimonyRentingBuilding.all.count}
    else
      puts "*** Unable to open: " + file
    end
  end

  def value dato
    value = dato ? dato.value : nil
    value.strip! if value.class.name == "String"
    return value
  end
end
