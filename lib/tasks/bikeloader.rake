task :load_recyclery_bike_db => :environmnent do
  puts "destroying old bike data"
  Bike.all.destroy
  file = "lib/assets/recyclery_bike_log.txt"
  puts "loading bike database from  #{file}"
  File.foreach(file).do |line|
    data = line.split("|")
    Bike.create(date: data[1])
  end
end

